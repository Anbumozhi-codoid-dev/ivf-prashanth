



import 'package:http/http.dart' as HTTP;



import '../Utils/AllImports.dart';


enum APIRequestType { GET, POST, PUT, PATCH, DELETE }

enum APIResponseStatus { SUCCESS, FAILED }

class APIResponse{
  APIResponseStatus status;
  Exception? exception;
  String message;
  dynamic data;

  APIResponse(this.status, this.data, {this.exception, this.message=''});
}

class APIEngine{
  final _jsonEncoder = const JsonEncoder();
  bool _showIndicator = false;

  Future<Map<String,String>> _prepareHeaders(bool isWithToken, bool isWithFirBase,) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); //getting token from localstorage
    String? firebaseToken = prefs.getString('firebasetoken');
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization':'Bearer $token',
      // 'devicetoken': '${await AppVOIPCallManager().voipToken}',
      // 'fcmtoken': '${await AppFCMHandler().fcmToken}',
      // 'appVersion': '${await AppDataHelper.appVersion}'
    };
    if (isWithToken) {
      {
        headers['Authorization'] = 'Bearer $token ';
      }
    } else if (isWithFirBase) {
      var type = Platform.isIOS ? 'iOS' : 'android';
      if (type == 'iOS') {
        headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'devicetype': 'iOS', //only for verifyOTP
          'devicetoken': '$firebaseToken',
        };
      } else if (type == 'android') {
        headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'devicetype': 'android', //only for verifyOTP
          'devicetoken':'$firebaseToken'
        };
      }
    }
    return headers;

  }

  Future<APIResponse> performRequest(   APIRequestType requestType,String url,{
    dynamic payload,
    bool showIndicator = true,
    bool isWithToken = true,
    bool isWithFireBaseToken = false,
  }) async {
    assert(url.isNotEmpty, 'URL must not be empty or null');
    if (requestType == APIRequestType.POST ||
        requestType == APIRequestType.PUT) {
      assert(payload != null, 'For POST request, you must send a payload.');
    }
    var headers =
        await _prepareHeaders(isWithToken, isWithFireBaseToken);
    print(headers);
    print('23456789012345678');
    print(headers);
    _showIndicator = showIndicator;
    if (_showIndicator) {
      AppAlertController().showProgressIndicator();
    }
    if (requestType == APIRequestType.POST ||
        requestType == APIRequestType.PUT ||
        requestType == APIRequestType.PATCH) {
      if (payload != null) {}
      ;
    }
    try {
      var actualURL = Uri.parse(url);
      switch (requestType) {
        case APIRequestType.GET:
          var response = await HTTP.get(actualURL, headers: headers);
          print(actualURL);
          return handleHTTPResponse(response);

        case APIRequestType.PUT:
          var response;
          var body;
          if (payload != null) {
            body = jsonEncode(payload);
            print("actualURL put");
            print(actualURL);

            response = await HTTP.put(actualURL, headers: headers, body: body);
          } else {
            response = await HTTP.put(actualURL, headers: headers);
          }
          return handleHTTPResponse(response);
        case APIRequestType.POST:
          var response;
          var body;
          if (payload != null) {
            body = _jsonEncoder.convert(payload);
            print("actualURL post");
            print(actualURL);
            print(body);

            response = await HTTP.post(actualURL, headers: headers, body: body);
          } else {
            response = await HTTP.post(actualURL, headers: headers);
          }
          return handleHTTPResponse(response);


        case APIRequestType.DELETE:
          var response;
          var body;
          if (payload != null) {
            body = _jsonEncoder.convert(payload);

            response =
            await HTTP.delete(actualURL, headers: headers, body: body);
          } else {
            response = await HTTP.delete(actualURL, headers: headers);
          }
          return handleHTTPResponse(response);

        case APIRequestType.PATCH:
          // TODO: Handle this case.
      }

    }catch(exception){
      // print('exception1111111');
      // print(exception);
      BuildContext? ccc = AppDataHelper.rootContext;
      // AppAlertController().showAlert(message: exception.toString(), inContext: ccc!);


      return commonExceptionResponse(exception as Exception);
    }
    return payload;

    }

  }
  APIResponse commonExceptionResponse(Exception exception) {
    var status = APIResponseStatus.FAILED;
    // var exception = Exception(AppConstant.commonExceptionMessage);
    var apiResponse = APIResponse(status, null, exception: exception);
    return apiResponse;
  }

  APIResponse handleHTTPResponse(HTTP.Response response) {
    AppAlertController().hideProgressIndicator(AppDataHelper.rootContext!);

    if (response.statusCode != 200) {
      try {
        var body = jsonDecode(response.body);
      } catch (_) {}
    }

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        var status = APIResponseStatus.SUCCESS;
        var data = jsonDecode(response.body);
        var apiResponse = APIResponse(status, data);
        return apiResponse;

      case 502:
      case 504:
        var status = APIResponseStatus.FAILED;
        var data = jsonDecode(response.body);
        var exception =
        Exception(
            data['status']['message'] );
        var apiResponse = APIResponse(status, data, exception: exception);
        return apiResponse;

      default:
        var status = APIResponseStatus.FAILED;
        var data = jsonDecode(response.body);
        var exception = Exception( data['status']['message']);

        var apiResponse = APIResponse(status, data, exception: exception);
        return apiResponse;
    }
  }


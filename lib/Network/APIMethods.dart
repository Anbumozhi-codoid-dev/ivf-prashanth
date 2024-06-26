

import 'APIEngine.dart';
import 'APIManager.dart';

typedef SuccessCompletionBlock = void Function(dynamic);
typedef FailureCompletionBlock = void Function(Exception);

enum ImageResource { CAMERA, GALLERY }

class APIManager {
  Future? sendOTP(
      {required var payload,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(
        APIRequestType.POST, APIUrlManager.PhoneNumberVerifyUrl,
        isWithToken: false, payload: payload, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? verifyOTP(
      {required var payload,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(
        APIRequestType.POST, APIUrlManager.otpVerifyUrl,
        isWithToken: false, payload: payload, showIndicator: showIndicator,isWithFireBaseToken:true);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }




  void _handleResponseCallBack(
      APIResponse response,
      SuccessCompletionBlock successBlock,
      FailureCompletionBlock failureBlock) {
    switch (response.status) {
      case APIResponseStatus.SUCCESS:
        successBlock(response.data);
        break;
      case APIResponseStatus.FAILED:
        failureBlock(response.exception!);
        break;
    }
  }
}

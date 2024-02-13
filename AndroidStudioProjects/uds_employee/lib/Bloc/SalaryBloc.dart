import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uds_employee/Allnavigations/AllimportedDirectory.dart';

import '../Network/APIManager.dart';
import '../Network/APIMethods.dart';
import '../Utils/AppAlertController.dart';

class SalaryEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetReimbursementListEvent extends SalaryEvent{
  String? status;
  BuildContext context;
  GetReimbursementListEvent(this.context, this.status);

}
class GetSalaryHomeApiEvent extends SalaryEvent{
  String? userID;
  BuildContext context;
  GetSalaryHomeApiEvent(this.context, this.userID);

}
class CreateReimbursementEvent extends SalaryEvent{
  List<String>? files;
  var data;
  BuildContext context;
  CreateReimbursementEvent(this.context, this.files, this.data);

}

class GetReimbursementDetailsEvent extends SalaryEvent{
  String? id;
  BuildContext context;
  GetReimbursementDetailsEvent(this.context, this.id);

}
class CreateResignRequestEvent extends SalaryEvent{

  var data;
  BuildContext context;
  CreateResignRequestEvent(this.context, this.data);

}

class UpdateResignRequestEvent extends SalaryEvent{

  var data;
  String resignId;
  BuildContext context;
  UpdateResignRequestEvent(this.context, this.data, this.resignId);

}
class GetResignFormEvent extends SalaryEvent{
  String id;
  BuildContext context;
  GetResignFormEvent(this.context, this.id);

}

class GetNoDueFormEvent extends SalaryEvent{
  String id;
  BuildContext context;
  GetNoDueFormEvent(this.context, this.id);

}

class CreateNoDueRequestEvent extends SalaryEvent{

  var data;
  BuildContext context;
  CreateNoDueRequestEvent(this.context, this.data);

}

class UpdateNoDueRequestEvent extends SalaryEvent{

  var data;
  String noDueId;
  BuildContext context;
  UpdateNoDueRequestEvent(this.context, this.data, this.noDueId);

}

class FetchEmployeeDataEvent extends SalaryEvent{


  String? userId;
  BuildContext context;
  FetchEmployeeDataEvent(this.context, this.userId);

}






class SalaryState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetReimbursementListInitialState extends SalaryState{


}
class GetReimbursementListLoadingState extends SalaryState{


}
class GetReimbursementListSuccessState extends SalaryState{
  var data;

  GetReimbursementListSuccessState(this.data);
}
class GetReimbursementListErrorState extends SalaryState{
  String error;

  GetReimbursementListErrorState(this.error);
}

class GetResignFormInitialState extends SalaryState{


}
class GetResignFormLoadingState extends SalaryState{


}
class GetResignFormSuccessState extends SalaryState{
  var data;

  GetResignFormSuccessState(this.data);
}
class GetResignFormErrorState extends SalaryState{
  String error;

  GetResignFormErrorState(this.error);
}

class GetNoDueInitialState extends SalaryState{


}
class GetNoDueFormLoadingState extends SalaryState{


}
class GetNoDueFormSuccessState extends SalaryState{
  var data;

  GetNoDueFormSuccessState(this.data);
}
class GetNoDueFormErrorState extends SalaryState{
  String error;

  GetNoDueFormErrorState(this.error);
}

class GetSalaryHomeApiInitialState extends SalaryState{


}
class GetSalaryHomeApiLoadingState extends SalaryState{


}
class GetSalaryHomeApiSuccessState extends SalaryState{
  var data;

  GetSalaryHomeApiSuccessState(this.data);
}
class GetSalaryHomeApiErrorState extends SalaryState{
  String error;

  GetSalaryHomeApiErrorState(this.error);
}



class CreateNoDueRequestInitialState extends SalaryState{


}
class CreateNoDueRequestLoadingState extends SalaryState{


}
class CreateNoDueRequestSuccessState extends SalaryState{
  var data;

  CreateNoDueRequestSuccessState(this.data);
}
class CreateNoDueRequestErrorState extends SalaryState{
  String error;

  CreateNoDueRequestErrorState(this.error);
}


class UpdateNoDueRequestLoadingState extends SalaryState{


}
class UpdateNoDueRequestSuccessState extends SalaryState{
  var data;

  UpdateNoDueRequestSuccessState(this.data);
}
class UpdateNoDueRequestErrorState extends SalaryState{
  String error;

  UpdateNoDueRequestErrorState(this.error);
}


class CreateResignRequestInitialState extends SalaryState{


}
class CreateResignRequestListLoadingState extends SalaryState{


}
class CreateResignRequestSuccessState extends SalaryState{
  var data;

  CreateResignRequestSuccessState(this.data);
}
class CreateResignRequestErrorState extends SalaryState{
  String error;

  CreateResignRequestErrorState(this.error);
}


class GetReimbursementDetailLoadingState extends SalaryState{


}
class GetReimbursementDetailSuccessState extends SalaryState{
  var data;

  GetReimbursementDetailSuccessState(this.data);
}
class GetReimbursementDetailErrorState extends SalaryState{
  String error;

  GetReimbursementDetailErrorState(this.error);
}




class CreateReimbursementLoadingState extends SalaryState{


}
class CreateReimbursementSuccessState extends SalaryState{
  var data;

  CreateReimbursementSuccessState(this.data);
}
class CreateReimbursementErrorState extends SalaryState{
  String error;

  CreateReimbursementErrorState(this.error);
}




class UpdateResignFormLoadingState extends SalaryState{


}
class UpdateResignFormSuccessState extends SalaryState{
  var data;

  UpdateResignFormSuccessState(this.data);
}
class UpdateResignFormErrorState extends SalaryState{
  String error;

  UpdateResignFormErrorState(this.error);
}


class FetchEmployeeDataLoadingState extends SalaryState{


}
class FetchEmployeeDataSuccessState extends SalaryState{
  var data;

  FetchEmployeeDataSuccessState(this.data);
}
class FetchEmployeeDataErrorState extends SalaryState{
  String error;

  FetchEmployeeDataErrorState(this.error);
}



class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  SalaryBloc() :super(GetReimbursementListInitialState());

  @override
  Stream<SalaryState> mapEventToState(SalaryEvent event) async* {
    yield GetReimbursementListLoadingState();
    if (event is GetReimbursementListEvent) {
      yield await _getReimbursementList(event);
    }
    if (event is CreateReimbursementEvent) {
      yield await _createReimbursement(event);
    }

    if (event is GetReimbursementDetailsEvent) {
      yield await _getReimbursementDetail(event);
    }
    if (event is CreateResignRequestEvent) {
      yield await _createResignRequest(event);
    }

    if (event is UpdateResignRequestEvent) {
      yield await _updateResignRequest(event);
    }

    if (event is GetResignFormEvent) {
      yield await _getResignForm(event);
    }
    if (event is GetSalaryHomeApiEvent) {
      yield await _getSalaryHomeApi(event);
    }
    if (event is GetNoDueFormEvent) {
      yield await _getNoDueForm(event);
    }
    if (event is CreateNoDueRequestEvent) {
      yield await _createNoDueRequest(event);
    }
    if (event is UpdateNoDueRequestEvent) {
      yield await _updateNoDueRequest(event);
    }
    if (event is FetchEmployeeDataEvent) {
      yield await _fetchEmployeeData(event);
    }
  }



  Future<SalaryState> _fetchEmployeeData(
      FetchEmployeeDataEvent event) async {
    var state;

    await APIManager().fetchEmployeeData(
      userId: event.userId,
      successBlock: (data) {
        state = FetchEmployeeDataSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state = FetchEmployeeDataErrorState(exception.toString());
      },);
    return state;
  }



  Future<SalaryState> _getReimbursementList(
      GetReimbursementListEvent event) async {
    var state;

    await APIManager().getReimbursementListApi(
      status: event.status!,
      successBlock: (data) {
        state = GetReimbursementListSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state = GetReimbursementListErrorState(exception.toString());
      },);
    return state;
  }



 Future<SalaryState> _getSalaryHomeApi(
      GetSalaryHomeApiEvent event) async {
    var state;

    await APIManager().getSalaryHomeApiMethod(
      userId: event.userID,
      successBlock: (data) {
        state = GetSalaryHomeApiSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state = GetSalaryHomeApiErrorState(exception.toString());
      },);
    return state;
  }


  Future<SalaryState> _getResignForm(
      GetResignFormEvent event) async {
    var state;

    await APIManager().getResignFormApi(
      id: event.id!,
      successBlock: (data) {
        state = GetResignFormSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state =  GetResignFormErrorState(exception.toString());
      },);
    return state;
  }

  Future<SalaryState> _getNoDueForm(
      GetNoDueFormEvent event) async {
    var state;

    await APIManager().getNoDueFormApi(
      id: event.id!,
      successBlock: (data) {
        state = GetNoDueFormSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state =  GetNoDueFormErrorState(exception.toString());
      },);
    return state;
  }



 Future<SalaryState> _getReimbursementDetail(
      GetReimbursementDetailsEvent event) async {
    var state;

    await APIManager().getReimbursementDetailApi(
      id: event.id!,
      successBlock: (data) {
        state = GetReimbursementDetailSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state = GetReimbursementDetailErrorState(exception.toString());
      },);
    return state;
  }

  Future<SalaryState> _createResignRequest(
      CreateResignRequestEvent event) async {
    var state;

    await APIManager().createResignRequestApi(
      data: event.data!,
      successBlock: (data) {
        state = CreateResignRequestSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state = CreateResignRequestErrorState(exception.toString());
      },);
    return state;
  }
  Future<SalaryState> _updateResignRequest(
      UpdateResignRequestEvent event) async {
    var state;

    await APIManager().updateResignRequestApi(
      data: event.data!,
      successBlock: (data) {
        state = UpdateResignFormSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state = UpdateResignFormErrorState(exception.toString());
      }, resignFormID: event.resignId,);
    return state;
  }

  Future<SalaryState> _createNoDueRequest(
      CreateNoDueRequestEvent event) async {
    var state;

    await APIManager().createNoDueRequestApi(
      data: event.data!,
      successBlock: (data) {
        state = CreateNoDueRequestSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state = CreateNoDueRequestErrorState(exception.toString());
      },);
    return state;
  }

  Future<SalaryState> _updateNoDueRequest(
      UpdateNoDueRequestEvent event) async {
    var state;

    await APIManager().updateNoDueRequestApi(
      data: event.data!,
      noDueID: event.noDueId,
      successBlock: (data) {
        state = UpdateNoDueRequestSuccessState(data);
      },
      failureBlock: (exception) {
        print("exception-75");
        print(exception);
        AppAlertController().showAlert(
            message: exception.toString(), inContext: event.context);
        state = UpdateNoDueRequestErrorState(exception.toString());
      },);
    return state;
  }

  Future<SalaryState> _createReimbursement(CreateReimbursementEvent event) async {
    var state;
    String? authToken;


    try{
      Dio dio = new Dio();

      SharedPreferences prefs = await SharedPreferences.getInstance();
        authToken = prefs.getString('token');


      print("data 562");
      // print(data.toJson());

      print('data 723');
      var formData = FormData.fromMap({

        "data": jsonEncode(event.data),


        //"certificate_1":  await  MultipartFile.fromFile(cropimage!.path),


      });
      print("certificateImages.length 981");
      print(event.files!.length);
      for (int i = 0 ; i < event.files!.length; i++){
        print("${ event.files![i]} imagess");
        print("${ event.files![i]} imagess type");
        print( event.files![i].startsWith('http:'));


        if( event.files![i] !="" &&  event.files![i].isNotEmpty){
          print("-------");
          if( event.files![i].startsWith('http:')){
            print("=======");

          }
          else{
            print("else =====");
            formData.files.add(MapEntry("document$i",await MultipartFile.fromFile(event.files![i]) ));

          }

        }





      }
      print(formData.fields);
      print("${formData.files} formdata imagesss");
           Response response;
      dio.options.contentType=Headers.multipartFormDataContentType;
      response = await dio.request(
       APIUrlManager.createReimbursementUrl ,
          options: Options(
            method: 'POST',
            headers: {
              'Content-Type': Headers.formUrlEncodedContentType,
              'Authorization': 'Bearer $authToken'  },
          ),
          data: formData);


      if (response.statusCode == 200) {
        state=CreateReimbursementSuccessState(response.data);



      } else {
        print('Failed to upload files. Status code: ${response.statusMessage }');
        print('Failed to upload files. Status code: ${response.statusCode}');
        AppAlertController().showAlert(message: response.statusMessage!, inContext: event.context);
      }

    }catch(error){

      print('error');
      if(error is DioException){

        print(error.response!.data['status']['message']);
        // AppAlertController().showAlert(message: error.response!.data['status']['message'], inContext: event.context);
        state=CreateReimbursementErrorState(error.response!.data['status']['message']);
      }else{
        AppAlertController().showAlert(message: error.toString(), inContext: event.context);
        state=CreateReimbursementErrorState(error.toString());

      }

      // print(error.response.statusMessage);





    }
    print('state 12232323');
    print(state);

    return state;
  }

}

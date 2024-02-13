import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as HTTP;
import 'package:uds_employee/Bloc/SalaryBloc.dart';
import 'package:uds_employee/Network/APIEngine.dart';
import 'package:uds_employee/Network/APIManager.dart';

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
        isWithToken: false, payload: payload, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? getOfferLetter(
      {required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(
        APIRequestType.GET, APIUrlManager.employeOfferLetter,
        isWithToken: true, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? getReimbursementListApi(
      {required String status,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(APIRequestType.GET,
        '${APIUrlManager.reimbursementListUrl}?status=$status',
        isWithToken: true, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? getResignFormApi( //AA
      {required String id,
        required SuccessCompletionBlock successBlock,
        required FailureCompletionBlock failureBlock,
        bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(APIRequestType.GET,
        '${APIUrlManager.resignUrl}$id/',
        isWithToken: true, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? getNoDueFormApi( //
      {required String id,
        required SuccessCompletionBlock successBlock,
        required FailureCompletionBlock failureBlock,
        bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(APIRequestType.GET,
        '${APIUrlManager.noDueUrl}$id/',
        isWithToken: true, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }
  Future? getReimbursementDetailApi(
      {required String id,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(APIRequestType.GET,
        '${APIUrlManager.reimbursementListUrl}$id/',
        isWithToken: true, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? createResignRequestApi(
      {required var data,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(
        APIRequestType.POST,
        APIUrlManager.resignUrl,
        isWithToken: true, showIndicator: showIndicator, payload: data);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? updateResignRequestApi(
      {required var data,
        required var resignFormID,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(
        APIRequestType.PUT,
        '${APIUrlManager.resignUrl}$resignFormID/',
        isWithToken: true, showIndicator: showIndicator, payload: data);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? createNoDueRequestApi(
      {required var data,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(
        APIRequestType.POST,
        APIUrlManager.noDueUrl,
        isWithToken: true, showIndicator: showIndicator, payload: data);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? updateNoDueRequestApi(
      {required var data,
        required String noDueID,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(
        APIRequestType.PUT,
        "${APIUrlManager.noDueUrl}/$noDueID/",
        isWithToken: true, showIndicator: showIndicator, payload: data);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }


  Future? getCalenderApi(
      {required String year,
      required String month,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(APIRequestType.GET,
        '${APIUrlManager.getCalenderUrl}?year=$year&month=$month',
        isWithToken: true, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? getShiftTIming(
      {required String year,
      required String month,
      required String day,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock,
      bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(APIRequestType.GET,
        '${APIUrlManager.getShiftTiming}?year=$year&month=$month&day=$day',
        isWithToken: true, showIndicator: showIndicator);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? updateAttendance({
    required var payload,
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }) async {
    var response = await APIEngine().performRequest(
        APIRequestType.POST, APIUrlManager.attendanceUpdate,
        isWithToken: true, payload: payload);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? chekInstatus({
    //   required var payload,
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }) async {
    var response = await APIEngine().performRequest(
        APIRequestType.GET, APIUrlManager.checkinStatus,
        isWithToken: true);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? checkOut({
    required var payload,
    required String attendanceId,
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }) async {
    var response = await APIEngine().performRequest(
        APIRequestType.PUT, '${APIUrlManager.getCalenderUrl}$attendanceId/',
        isWithToken: true, payload: payload);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? applyleave({
    required var payload,
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }) async {
    var response = await APIEngine().performRequest(
        APIRequestType.POST, APIUrlManager.applyLeave,
        isWithToken: true, payload: payload);
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? leaveStatus({
    required String userId,
    required String status,
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }) async {
    var response = await APIEngine().performRequest(
      APIRequestType.GET,
      '${APIUrlManager.applyLeave}?user=$userId&status=$status',
      isWithToken: true,
    );
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? cancelLeave(
      {
   required var payload,
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }
  ) async {
    var response = await APIEngine().performRequest(
      APIRequestType.POST,
      APIUrlManager.applyLeave,
      isWithToken: true,
      payload: payload
    );
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? leaveDetails({
    required String userId,
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }) async {
    var response = await APIEngine().performRequest(
      APIRequestType.GET,
      '${APIUrlManager.applyLeave}$userId/',
      isWithToken: true,
    );
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? getSalaryHomeApiMethod({
    required String? userId,
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }) async {
    var response = await APIEngine().performRequest(
      APIRequestType.GET,
      '${APIUrlManager.salaryHomeUrl}$userId/',
      isWithToken: true,
    );
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? leavetypeList({
    required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock,
  }) async {
    var response = await APIEngine().performRequest(
      APIRequestType.GET,
      APIUrlManager.leaveTypes,
      isWithToken: true,
    );
    _handleResponseCallBack(response, successBlock, failureBlock);

    return response;
  }

  Future? applyforPermission(
      {required var payload,
      required SuccessCompletionBlock successBlock,
      required FailureCompletionBlock failureBlock}) async{

    var response=await APIEngine().performRequest(APIRequestType.POST, APIUrlManager.permission,payload: payload,isWithToken: true);
    _handleResponseCallBack(response, successBlock, failureBlock);
    return response;
  }

  Future? getPermissionDetails({required String permissionId,       required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock}) async{
    var response=await APIEngine().performRequest(APIRequestType.GET, '${APIUrlManager.permission}$permissionId/',
    isWithToken: true);
    _handleResponseCallBack(response,successBlock,failureBlock);
    return response;
  }

  Future? getPermissionHistory({required String userId, required String status,required SuccessCompletionBlock successBlock,
    required FailureCompletionBlock failureBlock}) async{
    var response=await APIEngine().performRequest(APIRequestType.GET, '${APIUrlManager.permission}?user=$userId&status=$status',isWithToken: true);
    _handleResponseCallBack(response,successBlock,failureBlock);
    return response;
  }

  Future? fetchEmployeeData(
      {required String? userId,
        required SuccessCompletionBlock successBlock,
        required FailureCompletionBlock failureBlock,

        bool showIndicator = true}) async {
    var response = await APIEngine().performRequest(
        APIRequestType.GET, '${APIUrlManager.fetchData}$userId/',
        isWithToken: true, showIndicator: showIndicator);
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

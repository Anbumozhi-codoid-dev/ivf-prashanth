class LanguageList {
  LanguageList(this.id, this.language);

  String? language;
  String id;
}
class ReasonType {
  String key;
  String type;

  ReasonType({required this.key, required this.type});
}

List<ReasonType> reasonType = [
  ReasonType(key: "stay", type: "stay"),
  ReasonType(key: "Fuel", type: "Fuel"),
  ReasonType(key: "travel", type: "travel"),
];



class SendOTP {
  String phoneNumber;

  SendOTP({
    required this.phoneNumber,
  });

  factory SendOTP.fromJson(Map<String, dynamic> json) => SendOTP(
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
  };
}
class VerifyOTP {
  String phoneNumber;
  String otp;

  VerifyOTP({
    required this.phoneNumber,
    required this.otp,
  });

  factory VerifyOTP.fromJson(Map<String, dynamic> json) => VerifyOTP(
    phoneNumber: json["phone_number"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    "otp": otp,
  };
}

class EmployeeData {
  UserData userData;
  OfferLetter offerLetter;

  EmployeeData({
    required this.userData,
    required this.offerLetter,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
    userData: UserData.fromJson(json["user_data"]),
    offerLetter: OfferLetter.fromJson(json["offer_letter"]),
  );

}

class OfferLetter {
  String id;
  dynamic clientId;
  dynamic userId;
  // dynamic joiningDate;
  // dynamic endDate;
  LetterId letterId;
  // dynamic deleted;
  // bool deletedByCascade;
  // bool workingStatus;
  String jobTitle;
  String department;
  String designation;
  String grossSalary;
  // bool isFrom;
  // bool isEditable;
  // bool isActive;

  OfferLetter({
    required this.id,
    required this.clientId,
    required this.userId,
    // required this.joiningDate,
    // required this.endDate,
    required this.letterId,
    // required this.deleted,
    // required this.deletedByCascade,
    // required this.workingStatus,
    required this.jobTitle,
    required this.department,
    required this.designation,
    required this.grossSalary,
    // required this.isFrom,
    // required this.isEditable,
    // required this.isActive,

  });

  factory OfferLetter.fromJson(Map<String, dynamic> json) => OfferLetter(
    id: json["id"],
    clientId: json["client_id"],
    userId: json["user_id"],
    // joiningDate: json["joining_date"],
    // endDate: json["end_date"],
    letterId: LetterId.fromJson(json["letter_id"]),
    // deleted: json["deleted"],
    // deletedByCascade: json["deleted_by_cascade"],
    // workingStatus: json["working_status"],
    jobTitle: json["job_title"],
    department: json["department"],
    designation: json["designation"],
    grossSalary: json["gross_salary"],
    // isFrom: json["is_from"],
    // isEditable: json["is_editable"],
    // isActive: json["is_active"],

  );

}

class LetterId {
  String id;
  String mediaUrl;
  // dynamic deleted;
  // bool deletedByCascade;
  // dynamic awsUrl;
  // String fileExtension;
  // String mediaType;
  // bool isActive;


  LetterId({
    required this.id,
    required this.mediaUrl,
    // required this.deleted,
    // required this.deletedByCascade,
    // required this.awsUrl,
    // required this.fileExtension,
    // required this.mediaType,
    // required this.isActive,
  });

  factory LetterId.fromJson(Map<String, dynamic> json) => LetterId(
    id: json["id"].toString(),
    mediaUrl: json["media_url"].toString(),
    // deleted: json["deleted"],
    // deletedByCascade: json["deleted_by_cascade"],
    // awsUrl: json["aws_url"],
    // fileExtension: json["file_extension"],
    // mediaType: json["media_type"],
    // isActive: json["is_active"],
  );

}

class UserData {
  String id;
  UserRole userRole;
  List<dynamic> stateId;
  List<dynamic> regionId;
  List<dynamic> zoneId;
  dynamic userSignImage;
  dynamic userName;
  String firstName;
  String lastName;
  String email;
  String password;
  dynamic profileImage;
  dynamic title;
  String phoneNumber;
  dynamic joiningDate;
  bool passwordChanged;
  String userUid;
  String maritalStatus;
  // bool isActive;
  // DateTime createdAt;
  // DateTime modifiedAt;
  // String createdBy;
  // dynamic modifiedBy;
  // dynamic sessionId;

  UserData({
    required this.id,
    required this.userRole,
    required this.stateId,
    required this.regionId,
    required this.zoneId,
    required this.userSignImage,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.profileImage,
    required this.title,
    required this.phoneNumber,
    required this.joiningDate,
    required this.passwordChanged,
    required this.userUid,
    required this.maritalStatus,
    // required this.isActive,
    // required this.createdAt,
    // required this.modifiedAt,
    // required this.createdBy,
    // required this.modifiedBy,
    // required this.sessionId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    userRole: UserRole.fromJson(json["user_role"]),
    stateId: List<dynamic>.from(json["state_id"].map((x) => x)),
    regionId: List<dynamic>.from(json["region_id"].map((x) => x)),
    zoneId: List<dynamic>.from(json["zone_id"].map((x) => x)),
    userSignImage: json["user_sign_image"],
    userName: json["user_name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    password: json["password"],
    profileImage: json["profile_image"],
    title: json["title"],
    phoneNumber: json["phone_number"],
    joiningDate: json["joining_date"],
    passwordChanged: json["password_changed"],
    userUid: json["user_uid"],
    maritalStatus: json["marital_status"],
    // isActive: json["is_active"],
    // createdAt: DateTime.parse(json["created_at"]),
    // modifiedAt: DateTime.parse(json["modified_at"]),
    // createdBy: json["created_by"],
    // modifiedBy: json["modified_by"],
    // sessionId: json["session_id"],
  );

}

class UserRole {
  String id;
  // dynamic deleted;
  // bool deletedByCascade;
  String role;
  String description;
  // dynamic roleIcon;
  // bool isActive;
  // DateTime createdAt;
  // DateTime modifiedAt;
  // String createdBy;
  // dynamic modifiedBy;

  UserRole({
    required this.id,
    // required this.deleted,
    // required this.deletedByCascade,
    required this.role,
    required this.description,
    // required this.roleIcon,
    // required this.isActive,
    // required this.createdAt,
    // required this.modifiedAt,
    // required this.createdBy,
    // required this.modifiedBy,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    id: json["id"],
    // deleted: json["deleted"],
    // deletedByCascade: json["deleted_by_cascade"],
    role: json["role"].toString(),
    description: json["description"].toString(),
    // roleIcon: json["role_icon"],
    // isActive: json["is_active"],
    // createdAt: DateTime.parse(json["created_at"]),
    // modifiedAt: DateTime.parse(json["modified_at"]),
    // createdBy: json["created_by"],
    // modifiedBy: json["modified_by"],
  );

}


class GetCalenderData {
  String id;
  dynamic clientId;
  dynamic shiftId;
  bool present;
  DateTime date;
  bool overDue;
  dynamic overDueTime;
  bool leave;
  bool shiftChanged;
  bool working;
  bool weekoff;
  String year;
  dynamic leaveCount;
  String attendanceType;
  bool isActive;

  GetCalenderData({
    required this.id,
    required this.clientId,
    required this.shiftId,
    required this.present,
    required this.date,
    required this.overDue,
    required this.overDueTime,
    required this.leave,
    required this.shiftChanged,
    required this.working,
    required this.weekoff,
    required this.year,
    required this.leaveCount,
    required this.isActive,
    required this.attendanceType
  });

  factory GetCalenderData.fromJson(Map<String, dynamic> json) => GetCalenderData(
    id: json["id"],
    clientId: json["client_id"],
    shiftId: json["shift_id"],
    present: json["present"],
    date: DateTime.parse(json["date"]),
    overDue: json["over_due"],
    overDueTime: json["over_due_time"],
    leave: json["leave"],
    weekoff: json["weekoff"],
    shiftChanged: json["shift_changed"],
    working: json["working"],
    year: json["year"],
    leaveCount: json["leave_count"],
    isActive: json["is_active"],
    attendanceType: json['attendance_type']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "client_id": clientId,
    "shift_id": shiftId,
    "present": present,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "over_due": overDue,
    "over_due_time": overDueTime,
    "leave": leave,
    "shift_changed": shiftChanged,
    "working": working,
    "year": year,
    "weekoff": weekoff,
    "leave_count": leaveCount,
    "is_active": isActive,
    "attendance_type" : attendanceType
  };
}

class Attendance {
  String date;
  String year;
  String month;
  // bool? present;
  // bool? overDue;
  // String? overDueTime;
  // bool? leave;
  // bool? working;
  // bool? weekoff;
  // bool? shiftChanged;
  String checkInTime;
 // String? checkOutTime;

  Attendance({
    required  this.date,
    required this.year,
    required this.month,
     // this.present,
     // this.overDue,
     // this.overDueTime,
     // this.leave,
     // this.working,
     // this.weekoff,
     // this.shiftChanged,
    required  this.checkInTime,
    //  this.checkOutTime,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    date: json["date"],
    year: json["year"],
    month: json["month"],
   // present: json["present"],
    // overDue: json["over_due"],
    // overDueTime: json["over_due_time"],
    // leave: json["leave"],
    // working: json["working"],
    // weekoff: json["weekoff"],
    // shiftChanged: json["shift_changed"],
    checkInTime: json["check_in_time"],
    // checkOutTime: json["check_out_time"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "year": year,
    "month": month,
    // "present": present,
    // "over_due": overDue,
    // "over_due_time": overDueTime,
    // "leave": leave,
    // "working": working,
    // "weekoff": weekoff,
    // "shift_changed": shiftChanged,
    "check_in_time": checkInTime,
  //  "check_out_time": checkOutTime,
  };
}

class CheckOut {
  String date;
  String year;
  String month;
  // bool? present;
  // bool? overDue;
  // String? overDueTime;
  // bool? leave;
  // bool? working;
  // bool? weekoff;
  // bool? shiftChanged;
  //String? checkInTime;
   String checkOutTime;

  CheckOut({
    required  this.date,
    required  this.year,
    required  this.month,
    // this.present,
    // this.overDue,
    // this.overDueTime,
    // this.leave,
    // this.working,
    // this.weekoff,
    // this.shiftChanged,
   // this.checkInTime,
    required   this.checkOutTime,
  });

  factory CheckOut.fromJson(Map<String, dynamic> json) => CheckOut(
    date: json["date"],
    year: json["year"],
    month: json["month"],
    // present: json["present"],
    // overDue: json["over_due"],
    // overDueTime: json["over_due_time"],
    // leave: json["leave"],
    // working: json["working"],
    // weekoff: json["weekoff"],
    // shiftChanged: json["shift_changed"],
   // checkInTime: json["check_in_time"],
     checkOutTime: json["check_out_time"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "year": year,
    "month": month,
    // "present": present,
    // "over_due": overDue,
    // "over_due_time": overDueTime,
    // "leave": leave,
    // "working": working,
    // "weekoff": weekoff,
    // "shift_changed": shiftChanged,
    //"check_in_time": checkInTime,
      "check_out_time": checkOutTime,
  };
}
class OverTime {
  String date;
  String year;
  String month;
  // bool? present;
   bool overDue;
  // String? overDueTime;
  // bool? leave;
  // bool? working;
  // bool? weekoff;
  // bool? shiftChanged;
  //String? checkInTime;
 // String? checkOutTime;

  OverTime({
    required this.date,
    required this.year,
    required this.month,
    // this.present,
    required this.overDue,
    // this.overDueTime,
    // this.leave,
    // this.working,
    // this.weekoff,
    // this.shiftChanged,
    // this.checkInTime,
   // this.checkOutTime,
  });

  factory OverTime.fromJson(Map<String, dynamic> json) => OverTime(
    date: json["date"],
    year: json["year"],
    month: json["month"],
    // present: json["present"],
     overDue: json["over_due"],
    // overDueTime: json["over_due_time"],
    // leave: json["leave"],
    // working: json["working"],
    // weekoff: json["weekoff"],
    // shiftChanged: json["shift_changed"],
    // checkInTime: json["check_in_time"],
    //checkOutTime: json["check_out_time"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "year": year,
    "month": month,
    // "present": present,
     "over_due": overDue,
    // "over_due_time": overDueTime,
    // "leave": leave,
    // "working": working,
    // "weekoff": weekoff,
    // "shift_changed": shiftChanged,
    //"check_in_time": checkInTime,
 //   "check_out_time": checkOutTime,
  };
}



class HomeShiftDataModel {
  String id;
  String shiftName;
  String fromTime;
  String endTime;
  BranchData? branchData;
  bool checkIn;
  DateTime currentDate;

  HomeShiftDataModel({
    required this.id,
    required this.shiftName,
    required this.fromTime,
    required this.endTime,
    required this.branchData,
    // required this.clientdData,
    required this.checkIn,
    required this.currentDate,
  });

  factory HomeShiftDataModel.fromJson(Map<String, dynamic> json) => HomeShiftDataModel(
    id: json["id"].toString(),
    shiftName: json["shift_name"].toString(),
    fromTime: json["from_time"].toString(),
    endTime: json["end_time"].toString(),
    branchData: json["branch_data"] !=null ? BranchData.fromJson(json["branch_data"]) : null,

    checkIn: json["check_in"],
    currentDate: DateTime.parse(json["current_date"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "shift_name": shiftName,
  //   "from_time": fromTime,
  //   "end_time": endTime,
  //   "branch_data": branchData.toJson(),
  //   "client_id":clientdData.toJson(),
  //   "check_in": checkIn,
  // };
}


class ClientId {
  String id;
  // dynamic deleted;
  // bool deletedByCascade;
  String? clientName;
  // String description;
  // bool isActive;
  // DateTime createdAt;
  // DateTime modifiedAt;
  // String createdBy;
  // dynamic modifiedBy;
  // dynamic logoId;
  // String? regionName;
  // String? stateId;
  // String? stateName;

  ClientId({
    required this.id,
    // required this.deleted,
    // required this.deletedByCascade,
    this.clientName,
    // required this.description,
    // required this.isActive,
    // required this.createdAt,
    // required this.modifiedAt,
    // required this.createdBy,
    // required this.modifiedBy,
    // this.logoId,
    // this.regionName,
    // this.stateId,
    // this.stateName,
  });

  factory ClientId.fromJson(Map<String, dynamic> json) => ClientId(
    id: json["id"],
    // deleted: json["deleted"],
    // deletedByCascade: json["deleted_by_cascade"],
    clientName: json["client_name"],
    // description: json["description"],
    // isActive: json["is_active"],
    // createdAt: DateTime.parse(json["created_at"]),
    // modifiedAt: DateTime.parse(json["modified_at"]),
    // createdBy: json["created_by"],
    // modifiedBy: json["modified_by"],
    // logoId: json["logo_id"],
    // regionName: json["region_name"],
    // stateId: json["state_id"],
    // stateName: json["state_name"],
  );

}

class BranchData {
  String id;
  RegionId? regionId;
  ZoneId zoneId;
  ClientId clientdData;

  BranchData({
    required this.id,
    required this.regionId,
    required this.zoneId,
    required this.clientdData,
  });

  factory BranchData.fromJson(Map<String, dynamic> json) => BranchData(
    id: json["id"],
    regionId: RegionId.fromJson(json["region_id"]),
    clientdData: ClientId.fromJson(json['client_id']),

    zoneId: ZoneId.fromJson(json["zone_id"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "region_id": regionId?.toJson(),
    "zone_id": zoneId.toJson(),

  };
}

class RegionId {
  String id;
  String regionName;
  String description;
  String stateId;

  RegionId({
    required this.id,
    required this.regionName,
    required this.description,
    required this.stateId,
  });

  factory RegionId.fromJson(Map<String, dynamic> json) => RegionId(
    id: json["id"],
    regionName: json["region_name"],
    description: json["description"],
    stateId: json["state_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "region_name": regionName,
    "description": description,
    "state_id": stateId,
  };
}


class ZoneId {
  String id;
  String zoneName;
  String description;
  dynamic longitude;
  dynamic latitude;
  bool isActive;
  String stateId;
  String regionId;

  ZoneId({
    required this.id,
    required this.zoneName,
    required this.description,
    required this.longitude,
    required this.latitude,
    required this.isActive,
    required this.stateId,
    required this.regionId,
  });

  factory ZoneId.fromJson(Map<String, dynamic> json) => ZoneId(
    id: json["id"],
    zoneName: json["zone_name"],
    description: json["description"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    isActive: json["is_active"],
    stateId: json["state_id"],
    regionId: json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "zone_name": zoneName,
    "description": description,
    "longitude": longitude,
    "latitude": latitude,
    "is_active": isActive,
    "state_id": stateId,
    "region_id": regionId,
  };
}




class LeaveType{
  String id;
  String leaveType;


  LeaveType({
    required this.id,
    required this.leaveType,


  });

  factory LeaveType.fromJson(Map<String, dynamic> json) => LeaveType(
    id: json["id"],
    leaveType: json["leave_type"],

  );

}




class ApplyLeave {
  String fromDate;
  String? toDate;
  bool continueLeave;
  //String status;
  String notes;
  String userId;
  String? leaveType;
  String requestType;

  ApplyLeave({
    required this.fromDate,
    required this.toDate,
    required this.continueLeave,
   // required this.status,
    required this.notes,
    required this.userId,
    required this.leaveType,
    required this.requestType,
  });

  factory ApplyLeave.fromJson(Map<String, dynamic> json) => ApplyLeave(
    fromDate: json["from_date"],
    toDate: json["to_date"],
    continueLeave: json["continue_leave"],
   // status: json["status"],
    notes: json["notes"],
    userId: json["user_id"],
    leaveType: json["leave_type"],
    requestType: json["request_type"]
  );

  Map<String, dynamic> toJson() => {
    "from_date": fromDate,
    "to_date": toDate,
    "continue_leave": continueLeave,
  //  "status": status,
    "notes": notes,
    "user_id": userId,
    "leave_type": leaveType,
    "request_type": requestType
  };
}



class LeaveStatusType {
  String id;
  LeaveType? leaveType;
  DateTime fromDate;
  DateTime? toDate;
  bool continueLeave;
  String status;
  String notes;
  String createdAt;
  // DateTime appliedDate;
  dynamic approvedDate;
  String requestType;


  LeaveStatusType({
    required this.id,
    required this.leaveType,

    required this.fromDate,
    required this.toDate,
    required this.continueLeave,
    required this.status,
    required this.notes,
    required this.createdAt,
    // required this.appliedDate,
    required this.approvedDate,
    required this.requestType,

  });

  factory LeaveStatusType.fromJson(Map<String, dynamic> json) => LeaveStatusType(
    id: json["id"],

    leaveType: json["leave_type"] == null ? null : LeaveType.fromJson(json["leave_type"]),
    fromDate: DateTime.parse(json["from_date"]),
    toDate: json["to_date"] == null ? null : DateTime.parse(json["to_date"]),
    continueLeave: json["continue_leave"],
    status: json["status"].toString(),
    notes: json["notes"].toString(),
    createdAt: json["created_at"].toString(),
    // appliedDate: DateTime.parse(json["applied_date"]).toString(),
    approvedDate: json["approved_date"],
      requestType: json["request_type"].toString(),


  );

}





class CertificateId {
  String id;
  String mediaUrl;
  // dynamic deleted;
  // bool deletedByCascade;
  // dynamic awsUrl;
  // String fileExtension;
  // String mediaType;
  // bool isActive;
  // DateTime createdAt;
  // DateTime modifiedAt;
  // dynamic createdBy;
  // dynamic modifiedBy;

  CertificateId({
    required this.id,
    required this.mediaUrl,
    // required this.deleted,
    // required this.deletedByCascade,
    // required this.awsUrl,
    // required this.fileExtension,
    // required this.mediaType,
    // required this.isActive,
    // required this.createdAt,
    // required this.modifiedAt,
    // required this.createdBy,
    // required this.modifiedBy,
  });

  factory CertificateId.fromJson(Map<String, dynamic> json) => CertificateId(
    id: json["id"],
    mediaUrl: json["media_url"],
    // deleted: json["deleted"],
    // deletedByCascade: json["deleted_by_cascade"],
    // awsUrl: json["aws_url"],
    // fileExtension: json["file_extension"],
    // mediaType: json["media_type"],
    // isActive: json["is_active"],
    // createdAt: DateTime.parse(json["created_at"]),
    // modifiedAt: DateTime.parse(json["modified_at"]),
    // createdBy: json["created_by"],
    // modifiedBy: json["modified_by"],
  );
}


class PermissionApply {
  String fromTime;
  String toTime;
  String notes;
  String userId;
  String fromdate;

  PermissionApply({
    required this.fromTime,
    required this.toTime,
    required this.notes,
    required this.userId,
    required this.fromdate,
  });

  factory PermissionApply.fromJson(Map<String, dynamic> json) => PermissionApply(
    fromTime: json["from_time"],
    toTime: json["to_time"],
    notes: json["notes"],
    userId: json["user_id"],
    fromdate: json['for_date'],
  );

  Map<String, dynamic> toJson() => {
    "from_time": fromTime,
    "to_time": toTime,
    "notes": notes,
    "user_id": userId,
    "for_date" : fromdate,
  };
}



class PermissionData {
  String id;
  dynamic approverId;
  dynamic attendanceId;
  dynamic deleted;
  bool deletedByCascade;
  String fromTime;
  String toTime;
  String status;
  String createdAt;
  // DateTime appliedDate;
  dynamic approvedDate;
  DateTime forDate;
  String notes;


  PermissionData({
    required this.id,
    required this.approverId,
    required this.attendanceId,
    required this.deleted,
    required this.deletedByCascade,
    required this.fromTime,
    required this.toTime,
    required this.status,
    required this.notes,
    required this.createdAt,

    // required this.appliedDate,
    required this.approvedDate,
    required this.forDate,

  });

  factory PermissionData.fromJson(Map<String, dynamic> json) => PermissionData(
    id: json["id"],
    approverId: json["approver_id"],
    attendanceId: json["attendance_id"],
    deleted: json["deleted"],
    deletedByCascade: json["deleted_by_cascade"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    status: json["status"],
    createdAt: json['created_at'],
    // appliedDate: DateTime.parse(json["applied_date"]),
    approvedDate: json["approved_date"],
    forDate: DateTime.parse(json["for_date"]),
    notes: json['notes'],

  );

}
class CreateReimbursementObject {
  String? reasonType;
  String? wayType;
  String? wheelerType;
  String? kilometer;
  String? fromPlace;
  String? toPlace;
  String? amount;
  DateTime? forDate;
  String? userId;

  CreateReimbursementObject({
    required this.reasonType,
    required this.wayType,
    required this.wheelerType,
    required this.kilometer,
    required this.fromPlace,
    required this.toPlace,
    required this.amount,
    required this.forDate,
    required this.userId,
  });

  factory CreateReimbursementObject.fromJson(Map<String, dynamic> json) => CreateReimbursementObject(
    reasonType: json["reason_type"],
    wayType: json["way_type"],
    wheelerType: json["wheeler_type"],
    kilometer: json["Kilometer"],
    fromPlace: json["from_place"],
    toPlace: json["to_place"],
    amount: json["amount"],
    forDate: DateTime.parse(json["for_date"]),
    userId: json["user_id"],
  );



  Map<String, dynamic> toJson() => {
    "reason_type": reasonType,
    "way_type": wayType,
    "wheeler_type": wheelerType,
    "Kilometer": kilometer,
    "from_place": fromPlace,
    "to_place": toPlace,
    "amount": amount,
    "for_date": "${forDate?.year.toString().padLeft(4, '0')}-${forDate?.month.toString().padLeft(2, '0')}-${forDate?.day.toString().padLeft(2, '0')}",
    "user_id": userId,
  };
}

class ReimbursementListObject {
  String id;
  String reasonType;
  String wayType;
  String wheelerType;
  String status;
  dynamic purpose;
  String kilometer;
  String fromPlace;
  String toPlace;
  String amount;
  // DateTime appliedDate;
  // dynamic approvedDate;
  String? forDate;

  ReimbursementListObject({

    required this.id,
    required this.reasonType,
    required this.wayType,
    required this.wheelerType,
    required this.status,
    required this.purpose,
    required this.kilometer,
    required this.fromPlace,
    required this.toPlace,
    required this.amount,
    // required this.appliedDate,
    // required this.approvedDate,
    required this.forDate,
  });

  factory ReimbursementListObject.fromJson(Map<String, dynamic> json) => ReimbursementListObject(
    id: json["id"].toString(),
    reasonType: json["reason_type"].toString(),
    wayType: json["way_type"].toString(),
    wheelerType: json["wheeler_type"].toString(),
    status: json["status"].toString(),
    purpose: json["purpose"].toString(),
    kilometer: json["Kilometer"].toString(),
    fromPlace: json["from_place"].toString(),
    toPlace: json["to_place"].toString(),
    amount: json["amount"].toString(),
    // appliedDate: DateTime.parse(json["applied_date"]),
    // approvedDate: json["approved_date"],
    forDate: json["for_date"].toString(),
    // forDate: DateTime.parse(json["for_date"]).toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reason_type": reasonType,
    "way_type": wayType,
    "wheeler_type": wheelerType,
    "status": status,
    "purpose": purpose,
    "Kilometer": kilometer,
    "from_place": fromPlace,
    "to_place": toPlace,
    "amount": amount,
    // "applied_date": appliedDate.toIso8601String(),
    // "approved_date": approvedDate,
    "for_date" : forDate
    // "for_date": "${forDate.year.toString().padLeft(4, '0')}-${forDate.month.toString().padLeft(2, '0')}-${forDate.day.toString().padLeft(2, '0')}",
  };
}


class CertificateImageObject {
  String id;
  String mediaUrl;
  String fileExtension;
  String mediaType;

  CertificateImageObject({
    required this.id,
    required this.mediaUrl,
    required this.fileExtension,
    required this.mediaType,
  });

  factory CertificateImageObject.fromJson(Map<String, dynamic> json) => CertificateImageObject(
    id: json["id"],
    mediaUrl: json["media_url"],
    fileExtension: json["file_extension"],
    mediaType: json["media_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_url": mediaUrl,
    "file_extension": fileExtension,
    "media_type": mediaType,
  };
}


class CreateResignRequest {
  String requestType;
  String empDate;
  dynamic purpose;
  bool isEmployee;
  String userId;

  CreateResignRequest({
    required this.requestType,
    required this.empDate,
    required this.purpose,
    required this.isEmployee,
    required this.userId,
  });

  factory CreateResignRequest.fromJson(Map<String, dynamic> json) => CreateResignRequest(
    requestType: json["request_type"],
    empDate: json["emp_date"],
    purpose: json["purpose"],
    isEmployee: json["is_employee"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "request_type": requestType,
    "emp_date": empDate,
    "purpose": purpose,
    "is_employee": isEmployee,
    "user_id": userId,
  };
}

class CreateNoDueRequestObject {
  String location;
  String dateOfRelieving;
  String officialEmail;
  String kt;
  String backUp;
  String clearance;
  String salaryAdvance;
  String otherAdvance;
  String pettyCash;
  String settleExpenses;
  String itDoc;
  String happyAccount;
  String laptop;
  String cardAccessories;
  String sapLogin;
  String emailId;
  String loginId;
  String idAccessCard;
  String drawKey;
  String businessCard;
  String headset;
  String sim;
  String stationaryItems;
  String chargerCable;
  String medicalClaim;
  String exitInterview;
  String resignMail;
  String noticePeriod;
  String relevant;
  String companyProperty;
  String otherHandover;
  String userId;

  CreateNoDueRequestObject({
    required this.location,
    required this.dateOfRelieving,
    required this.officialEmail,
    required this.kt,
    required this.backUp,
    required this.clearance,
    required this.salaryAdvance,
    required this.otherAdvance,
    required this.pettyCash,
    required this.settleExpenses,
    required this.itDoc,
    required this.happyAccount,
    required this.laptop,
    required this.cardAccessories,
    required this.sapLogin,
    required this.emailId,
    required this.loginId,
    required this.idAccessCard,
    required this.drawKey,
    required this.businessCard,
    required this.headset,
    required this.sim,
    required this.stationaryItems,
    required this.chargerCable,
    required this.medicalClaim,
    required this.exitInterview,
    required this.resignMail,
    required this.noticePeriod,
    required this.relevant,
    required this.companyProperty,
    required this.otherHandover,
    required this.userId,
  });

  factory CreateNoDueRequestObject.fromJson(Map<String, dynamic> json) => CreateNoDueRequestObject(
    location: json["location"],
    dateOfRelieving:json["date_of_relieving"],
    officialEmail: json["official_email"],
    kt: json["kt"],
    backUp: json["back_up"],
    clearance: json["clearance"],
    salaryAdvance: json["salary_advance"],
    otherAdvance: json["other_advance"],
    pettyCash: json["petty_cash"],
    settleExpenses: json["settle_expenses"],
    itDoc: json["it_doc"],
    happyAccount: json["happy_account"],
    laptop: json["laptop"],
    cardAccessories: json["card_accessories"],
    sapLogin: json["sap_login"],
    emailId: json["email_id"],
    loginId: json["login_id"],
    idAccessCard: json["id_access_card"],
    drawKey: json["draw_key"],
    businessCard: json["business_card"],
    headset: json["headset"],
    sim: json["sim"],
    stationaryItems: json["stationary_items"],
    chargerCable: json["charger_cable"],
    medicalClaim: json["medical_claim"],
    exitInterview: json["exit_interview"],
    resignMail: json["resign_mail"],
    noticePeriod: json["notice_period"],
    relevant: json["relevant"],
    companyProperty: json["company_property"],
    otherHandover: json["other_handover"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "location": location,
    "date_of_relieving":dateOfRelieving,
    // "date_of_relieving": "${dateOfRelieving.year.toString().padLeft(4, '0')}-${dateOfRelieving.month.toString().padLeft(2, '0')}-${dateOfRelieving.day.toString().padLeft(2, '0')}",
    "official_email": officialEmail,
    "kt": kt,
    "back_up": backUp,
    "clearance": clearance,
    "salary_advance": salaryAdvance,
    "other_advance": otherAdvance,
    "petty_cash": pettyCash,
    "settle_expenses": settleExpenses,
    "it_doc": itDoc,
    "happy_account": happyAccount,
    "laptop": laptop,
    "card_accessories": cardAccessories,
    "sap_login": sapLogin,
    "email_id": emailId,
    "login_id": loginId,
    "id_access_card": idAccessCard,
    "draw_key": drawKey,
    "business_card": businessCard,
    "headset": headset,
    "sim": sim,
    "stationary_items": stationaryItems,
    "charger_cable": chargerCable,
    "medical_claim": medicalClaim,
    "exit_interview": exitInterview,
    "resign_mail": resignMail,
    "notice_period": noticePeriod,
    "relevant": relevant,
    "company_property": companyProperty,
    "other_handover": otherHandover,
    "user_id": userId,
  };
}


class CancelLeaveObject {
  String fromDate;
  dynamic toDate;
  String requestType;
  String leaveType;
  String notes;
  String userId;

  CancelLeaveObject({
    required this.fromDate,
    required this.toDate,
    required this.requestType,
    required this.leaveType,

    required this.notes,
    required this.userId,
  });

  factory CancelLeaveObject.fromJson(Map<String, dynamic> json) => CancelLeaveObject(
    fromDate: json["from_date"],
    toDate: json["to_date"],
    requestType: json["request_type"],
    leaveType: json["leave_type"],
    notes: json["notes"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "from_date": fromDate,
    "to_date": toDate,
    "request_type": requestType,
    "notes": notes,
    "user_id": userId,
    "leave_type":leaveType
  };
}

class GetResignObject {
  String id;
  String requestType;
  String empDate;
  dynamic manDate;
  String status;
  String purpose;
  String approvedDate;
  dynamic reasonForDecline;
  bool isManager;
  bool isEmployee;

  GetResignObject({
    required this.id,
    required this.requestType,
    required this.empDate,
    required this.manDate,
    required this.status,
    required this.purpose,
    required this.approvedDate,
    required this.reasonForDecline,
    required this.isManager,
    required this.isEmployee,
  });

  factory GetResignObject.fromJson(Map<String, dynamic> json) => GetResignObject(
    id: json["id"],
    requestType: json["request_type"],
    empDate: json["emp_date"],
    manDate: json["man_date"],
    status: json["status"],
    purpose: json["purpose"],
    approvedDate: json["approved_date"],
    reasonForDecline: json["reason_for_decline"],
    isManager: json["is_manager"],
    isEmployee: json["is_employee"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "request_type": requestType,
    "emp_date": empDate,
    "man_date": manDate,
    "status": status,
    "purpose": purpose,
    "approved_date": approvedDate,
    "reason_for_decline": reasonForDecline,
    "is_manager": isManager,
    "is_employee": isEmployee,
  };
}


class GetNoDueObject {
  String id;
  dynamic approverId;
  String location;
  String dateOfRelieving;
  String officialEmail;
  String kt;
  String backUp;
  String clearance;
  String salaryAdvance;
  String otherAdvance;
  String pettyCash;
  String settleExpenses;
  String itDoc;
  String happyAccount;
  String laptop;
  String cardAccessories;
  String sapLogin;
  String emailId;
  String loginId;
  String idAccessCard;
  String drawKey;
  String businessCard;
  String headset;
  String sim;
  String stationaryItems;
  String chargerCable;
  String medicalClaim;
  String exitInterview;
  String resignMail;
  String noticePeriod;
  String relevant;
  String companyProperty;
  String otherHandover;
  dynamic approvedDate;
  dynamic reasonForDecline;
  String status;

  GetNoDueObject({
    required this.id,
    required this.approverId,
    required this.location,
    required this.dateOfRelieving,
    required this.officialEmail,
    required this.kt,
    required this.backUp,
    required this.clearance,
    required this.salaryAdvance,
    required this.otherAdvance,
    required this.pettyCash,
    required this.settleExpenses,
    required this.itDoc,
    required this.happyAccount,
    required this.laptop,
    required this.cardAccessories,
    required this.sapLogin,
    required this.emailId,
    required this.loginId,
    required this.idAccessCard,
    required this.drawKey,
    required this.businessCard,
    required this.headset,
    required this.sim,
    required this.stationaryItems,
    required this.chargerCable,
    required this.medicalClaim,
    required this.exitInterview,
    required this.resignMail,
    required this.noticePeriod,
    required this.relevant,
    required this.companyProperty,
    required this.otherHandover,
    required this.approvedDate,
    required this.reasonForDecline,
    required this.status,
  });

  factory GetNoDueObject.fromJson(Map<String, dynamic> json) => GetNoDueObject(
    id: json["id"].toString(),
    approverId: json["approver_id"].toString(),
    location: json["location"].toString(),
    dateOfRelieving: json["date_of_relieving"].toString(),
    officialEmail: json["official_email"].toString(),
    kt: json["kt"].toString(),
    backUp: json["back_up"].toString(),
    clearance: json["clearance"].toString(),
    salaryAdvance: json["salary_advance"].toString(),
    otherAdvance: json["other_advance"].toString(),
    pettyCash: json["petty_cash"].toString(),
    settleExpenses: json["settle_expenses"].toString(),
    itDoc: json["it_doc"].toString(),
    happyAccount: json["happy_account"].toString(),
    laptop: json["laptop"].toString(),
    cardAccessories: json["card_accessories"].toString(),
    sapLogin: json["sap_login"].toString(),
    emailId: json["email_id"].toString(),
    loginId: json["login_id"].toString(),
    idAccessCard: json["id_access_card"].toString(),
    drawKey: json["draw_key"].toString(),
    businessCard: json["business_card"].toString(),
    headset: json["headset"].toString(),
    sim: json["sim"].toString(),
    stationaryItems: json["stationary_items"].toString(),
    chargerCable: json["charger_cable"].toString(),
    medicalClaim: json["medical_claim"].toString(),
    exitInterview: json["exit_interview"].toString(),
    resignMail: json["resign_mail"].toString(),
    noticePeriod: json["notice_period"].toString(),
    relevant: json["relevant"].toString(),
    companyProperty: json["company_property"].toString(),
    otherHandover: json["other_handover"].toString(),
    approvedDate: json["approved_date"].toString(),
    reasonForDecline: json["reason_for_decline"].toString(),
    status: json["status"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "approver_id": approverId,
    "location": location,
    "date_of_relieving": dateOfRelieving,
    // "date_of_relieving": "${dateOfRelieving.year.toString().padLeft(4, '0')}-${dateOfRelieving.month.toString().padLeft(2, '0')}-${dateOfRelieving.day.toString().padLeft(2, '0')}",
    "official_email": officialEmail,
    "kt": kt,
    "back_up": backUp,
    "clearance": clearance,
    "salary_advance": salaryAdvance,
    "other_advance": otherAdvance,
    "petty_cash": pettyCash,
    "settle_expenses": settleExpenses,
    "it_doc": itDoc,
    "happy_account": happyAccount,
    "laptop": laptop,
    "card_accessories": cardAccessories,
    "sap_login": sapLogin,
    "email_id": emailId,
    "login_id": loginId,
    "id_access_card": idAccessCard,
    "draw_key": drawKey,
    "business_card": businessCard,
    "headset": headset,
    "sim": sim,
    "stationary_items": stationaryItems,
    "charger_cable": chargerCable,
    "medical_claim": medicalClaim,
    "exit_interview": exitInterview,
    "resign_mail": resignMail,
    "notice_period": noticePeriod,
    "relevant": relevant,
    "company_property": companyProperty,
    "other_handover": otherHandover,
    "approved_date": approvedDate,
    "reason_for_decline": reasonForDecline,
    "status": status,
  };
}

class SalaryHomeObject {
  String userId;
  String resignId;
  String noDueId;

  SalaryHomeObject({
    required this.userId,
    required this.resignId,
    required this.noDueId,
  });

  factory SalaryHomeObject.fromJson(Map<String, dynamic> json) => SalaryHomeObject(
    userId: json["user_id"].toString(),
    resignId: json["resign_id"].toString(),
    noDueId: json["no_due_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "resign_id": resignId,
    "no_due_id": noDueId,
  };
}


// class FetchEmployeeDataObject {
//   String firstName;
//   String lastName;
//   String gender;
//   String dateOfBirth;
//   String placeOfBirth;
//   String emailId;
//   String phoneNumber;
//   String presentAddress;
//   String permanentAddress;
//   String bankName;
//   String accountNumber;
//   String bankBranch;
//   String ifscCode;
//   String accountHolderName;
//   String aadharNumber;
//   String panNumber;
//   dynamic uanNumber;
//
//   FetchEmployeeDataObject({
//     required this.firstName,
//     required this.lastName,
//     required this.gender,
//     required this.dateOfBirth,
//     required this.placeOfBirth,
//     required this.emailId,
//     required this.phoneNumber,
//     required this.presentAddress,
//     required this.permanentAddress,
//     required this.bankName,
//     required this.accountNumber,
//     required this.bankBranch,
//     required this.ifscCode,
//     required this.accountHolderName,
//     required this.aadharNumber,
//     required this.panNumber,
//     required this.uanNumber,
//   });
//
//   factory FetchEmployeeDataObject.fromJson(Map<String, dynamic> json) => FetchEmployeeDataObject(
//     firstName: json["first_name"],
//     lastName: json["last_name"],
//     gender: json["gender"],
//     dateOfBirth: json["date_of_birth"],
//     placeOfBirth: json["place_of_birth"],
//     emailId: json["email_id"],
//     phoneNumber: json["phone_number"],
//     presentAddress: json["present_address"],
//     permanentAddress: json["permanent_address"],
//     bankName: json["bank_name"],
//     accountNumber: json["account_number"],
//     bankBranch: json["bank_branch"],
//     ifscCode: json["ifsc_code"],
//     accountHolderName: json["account_holder_name"],
//     aadharNumber: json["aadhar_number"],
//     panNumber: json["pan_number"],
//     uanNumber: json["uan_number"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "first_name": firstName,
//     "last_name": lastName,
//     "gender": gender,
//     "date_of_birth": dateOfBirth,
//     // "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
//     "place_of_birth": placeOfBirth,
//     "email_id": emailId,
//     "phone_number": phoneNumber,
//     "present_address": presentAddress,
//     "permanent_address": permanentAddress,
//     "bank_name": bankName,
//     "account_number": accountNumber,
//     "bank_branch": bankBranch,
//     "ifsc_code": ifscCode,
//     "account_holder_name": accountHolderName,
//     "aadhar_number": aadharNumber,
//     "pan_number": panNumber,
//     "uan_number": uanNumber,
//   };
// }


class FetchEmployeeDataObject {
  String firstName;
  String lastName;
  String gender;
  String dateOfBirth;
  String placeOfBirth;
  String emailId;
  String phoneNumber;
  String presentAddress;
  String permanentAddress;
  String bankName;
  String accountNumber;
  String bankBranch;
  String ifscCode;
  String accountHolderName;
  String aadharNumber;
  String panNumber;
  dynamic uanNumber;
  String department;
  String designation;
  String joiningDate;
  dynamic userUid;

  FetchEmployeeDataObject({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.emailId,
    required this.phoneNumber,
    required this.presentAddress,
    required this.permanentAddress,
    required this.bankName,
    required this.accountNumber,
    required this.bankBranch,
    required this.ifscCode,
    required this.accountHolderName,
    required this.aadharNumber,
    required this.panNumber,
    required this.uanNumber,
    required this.department,
    required this.designation,
    required this.joiningDate,
    required this.userUid,
  });

  factory FetchEmployeeDataObject.fromJson(Map<String, dynamic> json) => FetchEmployeeDataObject(
    firstName: json["first_name"],
    lastName: json["last_name"],
    gender: json["gender"],
    dateOfBirth: json["date_of_birth"],
    placeOfBirth: json["place_of_birth"],
    emailId: json["email_id"],
    phoneNumber: json["phone_number"],
    presentAddress: json["present_address"],
    permanentAddress: json["permanent_address"],
    bankName: json["bank_name"],
    accountNumber: json["account_number"],
    bankBranch: json["bank_branch"],
    ifscCode: json["ifsc_code"],
    accountHolderName: json["account_holder_name"],
    aadharNumber: json["aadhar_number"],
    panNumber: json["pan_number"],
    uanNumber: json["uan_number"],
    department: json["department"],
    designation: json["designation"],
    joiningDate: json["joining_date"],
    userUid: json["user_uid"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
    "date_of_birth":dateOfBirth,
    // "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "place_of_birth": placeOfBirth,
    "email_id": emailId,
    "phone_number": phoneNumber,
    "present_address": presentAddress,
    "permanent_address": permanentAddress,
    "bank_name": bankName,
    "account_number": accountNumber,
    "bank_branch": bankBranch,
    "ifsc_code": ifscCode,
    "account_holder_name": accountHolderName,
    "aadhar_number": aadharNumber,
    "pan_number": panNumber,
    "uan_number": uanNumber,
    "department": department,
    "designation": designation,
    "joining_date":joiningDate,
    // "joining_date": "${joiningDate.year.toString().padLeft(4, '0')}-${joiningDate.month.toString().padLeft(2, '0')}-${joiningDate.day.toString().padLeft(2, '0')}",
    "user_uid": userUid,
  };
}








class coupleIdOTP {
  String coupleId;

  coupleIdOTP({
    required this.coupleId,
  });

  factory coupleIdOTP.fromJson(Map<String, dynamic> json) => coupleIdOTP(
    coupleId: json["coupleID"],
  );

  Map<String, dynamic> toJson() => {
    "coupleID": coupleId,
  };
}

class CoupleIdVerifyObject {
  String coupleId;
  String id;
  String otp;

  CoupleIdVerifyObject({
    required this.coupleId,
    required this.id,
    required this.otp,
  });

  factory CoupleIdVerifyObject.fromJson(Map<String, dynamic> json) => CoupleIdVerifyObject(
    coupleId: json["coupleID"],
    id: json["id"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "coupleID": coupleId,
    "id": id,
    "otp": otp,
  };
}

class SignupFormObject {
  String firstname;
  String lastname;
  String dobDay;
  String dobMonth;
  String dobYear;
  String country;
  String city;

  SignupFormObject({
    required this.firstname,
    required this.lastname,
    required this.dobDay,
    required this.dobMonth,
    required this.dobYear,
    required this.country,
    required this.city,
  });

  factory SignupFormObject.fromJson(Map<String, dynamic> json) => SignupFormObject(
    firstname: json["firstname"],
    lastname: json["lastname"],
    dobDay: json["dobDay"],
    dobMonth: json["dobMonth"],
    dobYear: json["dobYear"],
    country: json["country"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "dobDay": dobDay,
    "dobMonth": dobMonth,
    "dobYear": dobYear,
    "country": country,
    "city": city,
  };
}

class TreatmentListType{
  String id;
  String treatmentType;


  TreatmentListType({
    required this.id,
    required this.treatmentType,


  });

  factory TreatmentListType.fromJson(Map<String, dynamic> json) => TreatmentListType(
    id: json["id"].toString(),
    treatmentType: json["treatment_type"],

  );

}

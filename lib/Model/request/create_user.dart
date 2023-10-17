// To parse this JSON data, do
//
//     final createUserRequest = createUserRequestFromJson(jsonString);

import 'dart:convert';

CreateUserRequest createUserRequestFromJson(String str) =>
    CreateUserRequest.fromJson(json.decode(str));

String createUserRequestToJson(CreateUserRequest data) =>
    json.encode(data.toJson());

class CreateUserRequest {
  String? clientKey;
  String? deviceType;
  String? fname;
  String? lname;
  String? email;
  String? mobile;
  String? dob;
  String? password;
  String? confirmPassword;

  CreateUserRequest({
    this.clientKey,
    this.deviceType,
    this.fname,
    this.lname,
    this.email,
    this.mobile,
    this.dob,
    this.password,
    this.confirmPassword,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      CreateUserRequest(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        mobile: json["mobile"],
        dob: json["dob"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "fname": fname,
        "lname": lname,
        "email": email,
        "mobile": mobile,
        "dob": dob,
        "password": password,
        "confirm_password": confirmPassword,
      };
}

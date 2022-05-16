import 'dart:convert';

class UserHub{
  String? email;
  String? password;
  String? accessToken;

  // UserHub.formJson(Map<String ,dynamic> jsonData){
  //   email = jsonData['email'];
  //   password = jsonData['password'];
  //   accessToken = jsonData['accessToken'];
  // }
  UserHub({ this.email, this.password, this.accessToken});

  factory UserHub.fromJson(String body) {
    Map<String, dynamic> json = jsonDecode(body);

    return UserHub(

      email: json['email'],
      password: json['phone'],
      accessToken: json['accessToken'],
    );

  }
}
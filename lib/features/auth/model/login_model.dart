class LoginResponseDataModel {
  String? jwt;
  User? user;
  Error? error;

  LoginResponseDataModel({this.jwt, this.user, this.error});

  LoginResponseDataModel.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }
}

class User {
  int? id;
  String? username;
  String? email;

  User({
    this.id,
    this.username,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }
}

class Error {
  String? message;

  Error({
    this.message,
  });

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

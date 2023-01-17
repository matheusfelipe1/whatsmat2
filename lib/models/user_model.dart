import 'package:whatsmat/main.dart';

class UserModel {
  String? id;
  String? email;
  String? name;
  UserStatus? status;

  UserModel({
    this.email,
    this.id,this.name, this.status
  });

  UserModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    email = json['email'],
    name = json['name'],
    status = json['status'];
}
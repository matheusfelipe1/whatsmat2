import 'package:whatsmat/models/profile_models.dart';

import '../main.dart';

class ChatModel {
  String? id;
  String? datetime;
  String? senderId;
  String? recipientId;
  ProfileModel? profile;
  List<Messages>? messages;

  ChatModel(
      {this.id, this.datetime, this.senderId, this.recipientId, this.messages, this.profile});

  ChatModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        datetime = json['datetime'],
        recipientId = json['recipientId'],
        senderId = json['senderId'];
}

class Messages {
  String? id;
  String? value;
  String? datetime;
  String? senderId;
  String? recipientId;

  Messages(
      {this.id, this.value, this.datetime, this.senderId, this.recipientId});

  Messages.fromJson(dynamic json)
      : id = json['id'],
        value = json['value'],
        datetime = json['datetime'],
        recipientId = json['recipientId'],
        senderId = json['senderId'];
  List<Messages> listMessages(List datas) {
    final list = datas.map(Messages.fromJson).toList();
    list.sort((a, b) => b.datetime!.date().compareTo(a.datetime!.date()));
    return list;
  }
}

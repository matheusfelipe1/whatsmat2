import 'dart:async';

import 'package:whatsmat/datasources/datasource.dart';
import 'package:whatsmat/models/profile_models.dart';
import 'package:whatsmat/repositories/chat/ichat_repository.dart';

import '../../models/chat_models.dart';

class ChatRepository implements IChatRepository {
  final DataSource _dataSource = DataSource();

  @override
  Future<String> createChat(String myId, String personId) async {
    final idChat = await _dataSource.createChat(myId, personId);
    return idChat;
  }

  @override
  Future<void> addMessages(
      String myId, String personId, String value, String idChat) async {
    await _dataSource.addMessages(myId, personId, value, idChat);
  }

  @override
  String getIdUser() {
    final user = _dataSource.getCurrentUser();
    return user!.uid;
  }

  @override
  Future<List<ChatModel>> getChats(String id) async {
    List<ChatModel> chats = [];
    List<dynamic> datas = await _dataSource.getChats(id);
    for (var element in datas) {
      final data = element as Map;
      final List arrayDatas = [];
      final List finalDatas = [];
      data.forEach((key, value) {
        arrayDatas.add(value);
      });
      for (var element in arrayDatas) {
        ProfileModel profileModel = ProfileModel();
        if (element['senderId'] != id) {
          dynamic data = await _dataSource.getUserById(element['senderId']);
          Map<String, dynamic> json = {
            'id': element['senderId'],
            'name': data['name'],
          };
          profileModel = ProfileModel.fromJson(json);
        } else {
          dynamic data = await _dataSource.getUserById(element['recipientId']);
          Map<String, dynamic> json = {
            'id': element['recipientId'],
            'name': data['name'],
          };
          profileModel = ProfileModel.fromJson(json);
        }
        element['profile'] = profileModel;
        finalDatas.add(element);
      }
      chats = finalDatas.map(ChatModel.fromJson).toList();
    }
    return chats;
  }
}

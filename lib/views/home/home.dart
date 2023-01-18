import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsmat/main.dart';
import 'package:whatsmat/models/chat_models.dart';
import 'package:whatsmat/models/profile_models.dart';
import 'package:whatsmat/repositories/session/isession_repository.dart';
import 'package:whatsmat/repositories/session/session_repository.dart';

import '../../repositories/chat/chat_repository.dart';
import '../../repositories/chat/ichat_repository.dart';

part 'home.g.dart';

class Home = HomeBase with _$Home;

abstract class HomeBase with Store {
  final ISessionRepository _iSessionRepository = SessinRepository();
  final IChatRepository _chatRepository = ChatRepository();
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  String get myId => _chatRepository.getIdUser();

  @observable
  List<ChatModel> chats = [];
  ChatModel selectedChat = ChatModel();
  List<ChatModel> cached = [];

  @action
  void addChats() {
    ProfileModel perfil = ProfileModel(id: "161", name: 'Barbara');
    Messages messages = Messages(
        id: "khon",
        datetime: "2023-01-01",
        recipientId: "101",
        senderId: "01",
        value: "Bom dia");
    ChatModel chat = ChatModel(
        id: "65e65",
        datetime: "2023-01-01",
        messages: [messages],
        profile: perfil,
        recipientId: "101",
        senderId: "01");
    cached.add(chat);
    chats = cached;
  }

  signout() async {
    await _iSessionRepository.signout();
    Modular.to.pushReplacementNamed('/login/');
  }

  @action
  getListChats() async {
    chats = await _chatRepository.getChats(myId);
    chats.sort((a, b) => a.datetime!.date().compareTo(b.datetime!.date()));
  }

  @action
  listenChats() {
    _firebaseDatabase.ref().child('messages').onValue.listen((event) {
      final List list = [];
      final List finalDatas = [];
      Map data = event.snapshot.value as Map;
      data.forEach((key, value) {
        if (value['senderId'] == myId || value['recipientId'] == myId) {
          list.add(value);
        }
      });
      for (var element in list) {
        finalDatas.add(element);
      }
      List<ChatModel> _chats = finalDatas.map(ChatModel.fromJson).toList();
      for (var item in chats) {
        for (var item2 in _chats) {
          if (item.id == item2.id) {
            item.messages = item2.messages;
          }
        }
      }
      chats = chats;
    });
  }
}

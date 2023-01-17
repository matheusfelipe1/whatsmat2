import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsmat/models/chat_models.dart';
import 'package:whatsmat/models/profile_models.dart';
import 'package:whatsmat/repositories/session/isession_repository.dart';
import 'package:whatsmat/repositories/session/session_repository.dart';

part 'home.g.dart';

class Home = HomeBase with _$Home;

abstract class HomeBase with Store {
  final ISessionRepository _iSessionRepository = SessinRepository();

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
}

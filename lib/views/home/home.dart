import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsmat/models/chat_models.dart';
import 'package:whatsmat/models/profile_models.dart';

part 'home.g.dart';

class Home = HomeBase with _$Home;

abstract class HomeBase with Store {
  
  @observable
  List<ChatModel> chats = []; 
  List<ChatModel> cached = []; 

  @action
  void addChats() {
    ProfileModel perfil = ProfileModel(id: "161", name: 'Barbara');
    Messages messages = Messages(id: "khon", datetime: "2023-01-01", recipientId: "101", senderId: "01", value: "Bom dia");
    ChatModel chat = ChatModel(id: "65e65", datetime: "2023-01-01", messages: [messages], profile: perfil, recipientId: "101", senderId: "01" );
    cached.add(chat);
    chats = cached;
  }
  
}
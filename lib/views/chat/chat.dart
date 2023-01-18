import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsmat/main.dart';
import 'package:whatsmat/models/chat_models.dart';
import 'package:whatsmat/repositories/chat/chat_repository.dart';
import 'package:whatsmat/repositories/chat/ichat_repository.dart';

part 'chat.g.dart';

class Chat = ChatBase with _$Chat;

abstract class ChatBase with Store {
  final IChatRepository _chatRepository = ChatRepository();
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  String get myId => _chatRepository.getIdUser();

  @observable
  List<Messages> messages = [];

  @observable
  ChatModel chatSelected = ChatModel();

  @action
  addMessage(String value) async {
    await _chatRepository.addMessages(
        myId, chatSelected.profile!.id!, value, chatSelected.id!);
  }

  @action
  listeningChat() {
    _firebaseDatabase
        .ref()
        .child('messages')
        .child(chatSelected.id!)
        .child('messages')
        .onChildAdded
        .listen((event) {
      bool candAdd = true;
      dynamic data = event.snapshot.value as dynamic;
      Messages message = Messages();
      message = Messages.fromJson(data);
      List<Messages> cachedMessages = messages;
      for (var element in cachedMessages) {
        if (element.id == message.id) {
          candAdd = false;
        }
      }
      if (candAdd) {
        cachedMessages.add(message);
        messages = cachedMessages;
      }
    });
  }

  @action
  removeListening() {
    _firebaseDatabase
        .ref()
        .child('messages')
        .child(chatSelected.id!)
        .child('messages')
        .onChildAdded
        .listen((event) {})
        .cancel();
  }
}

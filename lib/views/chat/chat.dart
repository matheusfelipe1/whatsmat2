
import 'package:mobx/mobx.dart';
import 'package:whatsmat/models/chat_models.dart';
import 'package:whatsmat/repositories/chat/chat_repository.dart';
import 'package:whatsmat/repositories/chat/ichat_repository.dart';

part 'chat.g.dart';

class Chat = ChatBase with _$Chat;

abstract class ChatBase with Store {

  final IChatRepository _chatRepository = ChatRepository();

  String get myId  => _chatRepository.getIdUser();


  @observable
  List<Messages> messages = [];

  @observable
  ChatModel chatSelected = ChatModel();

  @action
  addMessage(String value) async {
    await _chatRepository.addMessages(myId, chatSelected.profile!.id!, value, chatSelected.id!);
  }

}
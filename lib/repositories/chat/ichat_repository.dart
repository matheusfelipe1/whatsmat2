import '../../models/chat_models.dart';

abstract class IChatRepository {
  Future<String> createChat(String myId, String personId);
  Future<void> addMessages(String myId, String personId, String value, String idChat);
  String getIdUser();
  Future<List<ChatModel>> getChats(String id);
}
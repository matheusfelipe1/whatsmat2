abstract class IChatRepository {
  Future<String> createChat(String myId, String personId);
  Future<void> addMessages(String myId, String personId, String value, String idChat);
  String getIdUser();
  getChats(String id);
}
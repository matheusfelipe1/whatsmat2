import 'package:whatsmat/datasources/datasource.dart';
import 'package:whatsmat/repositories/chat/ichat_repository.dart';

class ChatRepository implements IChatRepository{

  final DataSource _dataSource = DataSource();

  @override
  Future<String> createChat(String myId, String personId) async {
    final idChat = await _dataSource.createChat(myId, personId);
    return idChat;
  }

  @override
  Future<void> addMessages(String myId, String personId, String value, String idChat) async {
    await _dataSource.addMessages(myId, personId, value, idChat);
  }

  @override
  String getIdUser() {
    final user =  _dataSource.getCurrentUser();
    return user!.uid;
  }

  @override
  getChats(String id) async {
    await _dataSource.getChats(id);
  }
}
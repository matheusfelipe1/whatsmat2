import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:whatsmat/models/user_model.dart';

class DataSource {
  final String colletionUser = 'User';
  final String child = 'messages';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signin(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> register(String email, String name, String id) async {
    await _firebaseFirestore
        .collection(colletionUser)
        .doc(id)
        .set({'name': name, 'email': email});
  }

  Future<dynamic> getUserById(String id) async {
    return await _firebaseFirestore.collection(colletionUser).doc(id).get();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }

  Future<String> createChat(String myId, String personId) async {
    final idChat = _firebaseDatabase.ref().child(child).push().key;
    await _firebaseDatabase.ref().child(child).child(idChat!).set({
      'datetime': DateTime.now().toIso8601String(),
      'senderId': myId,
      'recipientId': personId,
      'id': idChat
    });
    return idChat;
  }

  Future<void> addMessages(
      String myId, String personId, String value, String idChat) async {
    final idMessage = _firebaseDatabase
        .ref()
        .child(child)
        .child(idChat)
        .child('messages')
        .push()
        .key;
    await Future.wait([
      _firebaseDatabase
          .ref()
          .child(child)
          .child(idChat)
          .update({'datetime': DateTime.now().toIso8601String()}),
      _firebaseDatabase
          .ref()
          .child(child)
          .child(idChat)
          .child('messages')
          .child(idMessage!)
          .set({
        'datetime': DateTime.now().toIso8601String(),
        'senderId': myId,
        'recipientId': personId,
        'id': idMessage,
        'value': value
      })
    ]);
  }

  Future<List> getChats(String id) async {
    List<dynamic> returns = [];
    DataSnapshot recipient = await _firebaseDatabase
        .ref()
        .child(child)
        .orderByChild('recipientId')
        .equalTo(id)
        .get();
    DataSnapshot sender = await _firebaseDatabase
        .ref()
        .child(child)
        .orderByChild('senderId')
        .equalTo(id)
        .get();
    if (recipient.value != null) {
      returns.add(recipient.value);
    }
    if (sender.value != null) {
      returns.add(sender.value);
    }
    return returns;
  }
}

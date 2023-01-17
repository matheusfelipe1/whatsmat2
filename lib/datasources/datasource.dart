import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:whatsmat/models/user_model.dart';

class DataSource {
  final String colletionUser = 'User';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signin(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> register(String email, String name, String id) async {
    await _firebaseFirestore.collection(colletionUser).doc(id).set({
      'name': name,
      'email': email
    });
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
}

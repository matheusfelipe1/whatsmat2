import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsmat/datasources/datasource.dart';
import 'package:whatsmat/main.dart';
import 'package:whatsmat/models/user_model.dart';
import 'package:whatsmat/repositories/session/isession_repository.dart';

class SessinRepository implements ISessionRepository {
  final DataSource _dataSource = DataSource();

  @override
  Future<UserModel> doLogin(String email, String password) async {
    final user = await _dataSource.signin(email, password);
    dynamic data = await _dataSource.getUserById(user.user!.uid);
    Map<String, dynamic> json = {
      'id': user.user!.uid,
      'name': data['name'],
      'email': data['email'],
      'status': UserStatus.logged
    };
    return UserModel.fromJson(json);
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = _dataSource.getCurrentUser();
    if (user != null) {
      dynamic data = await _dataSource.getUserById(user.uid);
      Map<String, dynamic> json = {
        'id': user.uid,
        'name': data['name'],
        'email': data['email'],
        'status': UserStatus.logged
      };
      return UserModel.fromJson(json);
    }
    return null;
  }

  @override
  Future<void> signout() async {
    await _dataSource.signout();
  }
}

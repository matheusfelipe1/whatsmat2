import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/main.dart';
import 'package:whatsmat/models/user_model.dart';
import 'package:whatsmat/repositories/session/isession_repository.dart';
import 'package:whatsmat/repositories/session/session_repository.dart';

class SplashController {
  final ISessionRepository _sessionRepository = SessinRepository();
  UserModel? user;

  verifyHasUserLogged() async {
    user = UserModel();
    user!.status = UserStatus.unlogged;
    user = await _sessionRepository.getCurrentUser();
    if (user != null) {
      Modular.to.pushReplacementNamed('/home/');
    } else {
      Modular.to.pushNamed('/login/');
    }
  }
}
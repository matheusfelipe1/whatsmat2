import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsmat/models/user_model.dart';
import 'package:whatsmat/repositories/session/isession_repository.dart';
import 'package:whatsmat/repositories/session/session_repository.dart';

import '../../shared/utils/app_utils.dart';

part 'login.g.dart';

class Login = LoginBase with _$Login;

abstract class LoginBase with Store {
  final ISessionRepository _iSessionRepository = SessinRepository();
  UserModel user = UserModel();

  doLogin(String email, String password, BuildContext context) async {
    try {
      user = await _iSessionRepository.doLogin(email.trim(), password.trim());
      Modular.to.pushReplacementNamed('/home/');
    } catch (e) {
      debugPrint(e.toString());
      AppUtils().showAlertOk('Erro!', 'Não foi possível efetuar o login', () {
        Modular.to.pop();
      }, context);
    }
  }
}

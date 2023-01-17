import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsmat/repositories/register/iregister_repository.dart';
import 'package:whatsmat/shared/utils/app_utils.dart';

import '../../repositories/register/register_repository.dart';

part 'register.g.dart';

class Register = RegisterBase with _$Register;

abstract class RegisterBase with Store {
  final IRegisterRepository _registerRepository = RegisterRepository();

  createUser(String name, String email, String password, BuildContext context) async {
    await _registerRepository.createUser(email, password, name).then((value) {
      AppUtils().showAlertOk('Sucesso!',
          'Seu usuário foi cadastrado com sucesso!\nClique no botão abaixo para acessar o App.',
          () {
        Modular.to.pop();
        Modular.to.pop();
      }, context);
    }).catchError((onError) {
      debugPrint(onError.toString());
      AppUtils().showAlertOk('Erro!', 'Houve um erro ao cadastrar seu usuário',
          () {
        Modular.to.pop();
      }, context);
    });
  }
}

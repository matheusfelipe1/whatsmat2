import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/views/login/login.dart';
import 'package:whatsmat/views/login/login_screen.dart';

class LoginModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => Login())
  ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const LoginScreen(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 500))
      ];
}

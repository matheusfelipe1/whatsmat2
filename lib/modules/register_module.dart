import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/views/register/register_screen.dart';

import '../views/register/register.dart';

class RegisterModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => Register())
  ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, arg) => const RegisterScreen(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 100))
      ];
}

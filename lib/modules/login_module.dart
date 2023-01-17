import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/views/login/login_screen.dart';

class LoginModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const Login(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 500))
      ];
}

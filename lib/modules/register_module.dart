import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/views/register/register_screen.dart';

class RegisterModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, arg) => const Register(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 500))
      ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/modules/register_module.dart';
import 'package:whatsmat/views/splash/splash_screen.dart';

import 'home_module.dart';
import 'login_module.dart';

class AppModules extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const Splash(),
        ),
        ModuleRoute('/register', module: RegisterModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}

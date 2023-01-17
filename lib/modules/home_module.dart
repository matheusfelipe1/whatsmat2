import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/views/chat/chat_screen.dart';

import '../views/home/home.dart';
import '../views/home/home_screen.dart';

class HomeModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => 
  [
    Bind.singleton((i) => Home())
  ];
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const HomeScreen(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 500)),
        ChildRoute('/chat',
            child: (context, args) => const Chat(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 500)),
      ];
}

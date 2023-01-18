import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/views/chat/chat.dart';

import '../views/chat/chat_screen.dart';

class ChatModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => Chat())
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/',
            child: (context, args) => ChatScreen(chat: args.data),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 100))
  ];
}
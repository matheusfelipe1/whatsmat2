import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsmat/views/chat/chat.dart';

import '../../models/chat_models.dart';

class ChatScreen extends StatefulWidget {
  ChatModel chat;
  ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = Modular.get<Chat>();
  final msg = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getChats();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 180, 254),
        automaticallyImplyLeading: true,
        title: const Text('Chat'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/app/chat.jpeg',
            height: size.height,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Observer(
              builder: (_) => SizedBox(
                height: size.height * .8,
                child: ListView.builder(
                  itemCount: _controller.messages.length,
                  itemBuilder: (context, index) {
                    return redirectWidget(_controller.messages[index]);
                  },
                ),
              ),
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: size.width,
          height: size.height * .06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * .82,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 205, 203, 203),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      controller: msg,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Digite sua mensagem..'),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _controller.addMessage(msg.text.trim());
                  },
                  icon: const Icon(Icons.send))
            ],
          ),
        ),
      ),
    );
  }

  Widget myMessage(String msg, String datetime) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: size.width * .8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.zero),
          color: (Colors.blue[200]),
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          msg,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  Widget anotherMessage(String msg, String datetime) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: size.width * .8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.zero,
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.grey.shade200,
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          msg,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  Widget redirectWidget(Messages message) {
    if (message.senderId == _controller.myId) {
      return myMessage(message.value!, message.datetime!);
    }
    return anotherMessage(message.value!, message.datetime!);
  }
}

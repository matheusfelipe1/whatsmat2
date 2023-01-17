import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsmat/views/home/home.dart';
import 'package:whatsmat/widgets/card_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final _home = Modular.get<Home>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 89, 180, 254),
          automaticallyImplyLeading: false,
          title: const Text('Home'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () async {
                  await _home.signout();
                },
                child: const Icon(FontAwesomeIcons.signOut),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(
              child: SizedBox(
                width: size.width * .8,
                height: size.height * .06,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 190, 188, 188),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.blue, width: 1.0),
                            // ),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //       color: Color.fromARGB(255, 0, 0, 0), width: 1.0),
                            // ),
                            suffixIcon: Icon(
                              FontAwesomeIcons.userFriends,
                              size: 15,
                            ),
                            hintText: 'Informe seu e-mail',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .7,
              child: Observer(
                  warnWhenNoObservables: true,
                  builder: (_) {
                    return ListView.builder(
                      itemCount: _home.chats.length,
                      itemBuilder: ((context, index) {
                        return CardList(
                            func: () {
                              _home.selectedChat = _home.chats[index];
                              Modular.to.pushNamed('/home/chat',
                                  arguments: _home.selectedChat);
                            },
                            datetime:
                                _home.chats[index].messages!.last.datetime!,
                            message: _home.chats[index].messages!.last.value!,
                            name: _home.chats[index].profile!.name!);
                      }),
                    );
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _home.addChats,
          child: const Icon(Icons.person_add),
        ),
      ),
    );
  }
}

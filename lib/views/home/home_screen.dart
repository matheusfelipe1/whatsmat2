import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsmat/views/home/home.dart';

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
          automaticallyImplyLeading: false,
          title: const Text('Home'),
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
              height: size.height * .6,
              child: Observer(
                  warnWhenNoObservables: true,
                  builder: (_) {
                    return ListView.builder(
                      itemCount: _home.chats.length,
                      itemBuilder: ((context, index) {
                        return const ListTile(
                          leading: CircleAvatar(
                              child: Center(
                            child: Text('M'),
                          )),
                        );
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

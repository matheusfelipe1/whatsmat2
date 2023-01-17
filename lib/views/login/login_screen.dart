import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/views/login/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _login = Modular.get<Login>();
  final email = TextEditingController();
  final password = TextEditingController();
  final key = GlobalKey<FormState>();
  bool _pending = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Form(
        key: key,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: size.width * .8,
                  height: size.height * .08,
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null) {
                        return 'Informe seu e-mail';
                      }
                      if (value.isEmpty) {
                        return 'Informe seu e-mail';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 1.0),
                        ),
                        hintText: 'Informe seu e-mail',
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                child: SizedBox(
                  width: size.width * .8,
                  height: size.height * .08,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Informe sua senha';
                      }
                      if (value.isEmpty) {
                        return 'Informe sua senha';
                      }
                      return null;
                    },
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 1.0),
                        ),
                        hintText: 'Informe sua senha',
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                child: GestureDetector(
                  onTap: _pending
                      ? null
                      : () async {
                          setState(() {
                            _pending = true;
                          });
                          if (key.currentState!.validate()) {
                            await _login.doLogin(email.text.trim(),
                                password.text.trim(), context);
                          }
                          setState(() {
                            _pending = false;
                          });
                        },
                  child: Container(
                    width: size.width * .8,
                    height: size.height * .08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(colors: [
                          _pending
                              ? Colors.grey
                              : const Color.fromARGB(255, 89, 180, 254),
                          _pending
                              ? Colors.grey
                              : const Color.fromARGB(255, 221, 221, 221)
                        ])),
                    child: Center(
                        child: Text(
                      _pending ? 'Entrando..' : 'Entrar',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                child: GestureDetector(
                  onTap: _pending
                      ? null
                      : () {
                          Modular.to.pushNamed('/register/');
                        },
                  child: Container(
                    width: size.width * .8,
                    height: size.height * .08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(colors: [
                          _pending
                              ? Colors.grey
                              : const Color.fromARGB(255, 89, 180, 254),
                          _pending
                              ? Colors.grey
                              : const Color.fromARGB(255, 221, 221, 221)
                        ])),
                    child: const Center(
                        child: Text(
                      'Cadastre-se',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

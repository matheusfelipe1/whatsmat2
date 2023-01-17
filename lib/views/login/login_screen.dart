import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SizedBox(
                width: size.width * .8,
                height: size.height * .08,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
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
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
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
                onTap: () {
                  Modular.to.pushReplacementNamed('/home/');
                },
                child: Container(
                  width: size.width * .8,
                  height: size.height * .08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 89, 180, 254),
                        Color.fromARGB(255, 221, 221, 221)
                      ])),
                  child: const Center(
                      child: Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('/register/');
                },
                child: Container(
                  width: size.width * .8,
                  height: size.height * .08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 89, 180, 254),
                        Color.fromARGB(255, 221, 221, 221)
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
    );
  }
}

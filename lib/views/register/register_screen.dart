import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Cadastro'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * .6,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: size.width * .8,
                      height: size.height * .08,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 1.0),
                            ),
                            hintText: 'Informe seu nome',
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 1.0),
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
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 1.0),
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
                    child: SizedBox(
                      width: size.width * .8,
                      height: size.height * .08,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 1.0),
                            ),
                            hintText: 'Confirme sua senha',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                ]),
          ),
        ),
      ),
      bottomSheet: GestureDetector(
        onTap: () {
        },
        child: Container(
          margin: EdgeInsets.only(left: size.width * .1, bottom: size.height * .01),
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
            'Enviar',
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ),
      ),
    );
  }
}

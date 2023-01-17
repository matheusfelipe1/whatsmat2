import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsmat/views/register/register.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confir = TextEditingController();
  final _register = Modular.get<Register>();
  final _key = GlobalKey<FormState>();
  bool showPass1 = true;
  bool showPass2 = true;
  bool _pending = false;
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
            child: Form(
              key: _key,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: size.width * .8,
                        height: size.height * .08,
                        child: TextFormField(
                          controller: _name,
                          validator: (value) {
                            if (value == null) {
                              return 'Nome é obrigatório';
                            }
                            if (value.isEmpty) {
                              return 'Nome é obrigatório';
                            }
                            return null;
                          },
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
                          controller: _email,
                          validator: (value) {
                            if (value == null) {
                              return 'E-mail é obrigatório';
                            }
                            if (value.isEmpty) {
                              return 'E-mail é obrigatório';
                            }
                            return null;
                          },
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
                          controller: _pass,
                          obscureText: showPass1,
                          validator: (value) {
                            if (value == null) {
                              return 'Senha é obrigatório';
                            }
                            if (value.isEmpty) {
                              return 'Senha é obrigatório';
                            }
                            if (value.trim() != _confir.text.trim()) {
                              return "Senhas não coincidem";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1.0),
                              ),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPass1 = !showPass1;
                                    });
                                  },
                                  child: Icon(showPass1
                                      ? FontAwesomeIcons.eyeLowVision
                                      : FontAwesomeIcons.eye)),
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
                          obscureText: showPass2,
                          controller: _confir,
                          validator: (value) {
                            if (value == null) {
                              return 'Senha é obrigatório';
                            }
                            if (value.isEmpty) {
                              return 'Senha é obrigatório';
                            }
                            if (value.trim() != _pass.text.trim()) {
                              return "Senhas não coincidem";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1.0),
                              ),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPass2 = !showPass2;
                                    });
                                  },
                                  child: Icon(showPass2
                                      ? FontAwesomeIcons.eyeLowVision
                                      : FontAwesomeIcons.eye)),
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
      ),
      bottomSheet: GestureDetector(
        onTap: _pending
            ? null
            : () async {
                setState(() {
                  _pending = true;
                });
                if (_key.currentState!.validate()) {
                  await _register.createUser(_name.text.trim(),
                      _email.text.trim(), _pass.text.trim(), context);
                }
                setState(() {
                  _pending = false;
                });
              },
        child: Container(
          margin:
              EdgeInsets.only(left: size.width * .1, bottom: size.height * .01),
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
            _pending ? 'Enviando..' : 'Enviar',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          )),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsmat/app_widget.dart';

import 'modules/app_modules.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
        await Firebase.initializeApp();
        runApp(ModularApp(module: AppModules(), child: const AppWidget()));
      });
  
}

extension ConvertToDateTime on String {
  DateTime date() {
    return DateTime.parse(this);
  }

  String datePtBR() {
    String firstSplit = this.split('T').first;
    List<String> date = firstSplit.split('-');
    return date.reversed.join('/');
  }
}

enum UserStatus {
  unlogged,
  logged
}

import 'package:flutter/material.dart';
import 'package:whatsmat/main.dart';

class CardList extends StatelessWidget {
  final String name;
  final String datetime;
  final String message;

  const CardList(
      {super.key,
      required this.datetime,
      required this.message,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          child: Center(
        child: Text(getFirstLetter(name)),
      )),
      title: Text(name),
      subtitle: Text(message),
      trailing: Text(datetime.datePtBR()),
    );
  }

  String getFirstLetter(String query) {
    var letter = query.substring(0, 1);
    return letter;
  }
}

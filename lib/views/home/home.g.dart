// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Home on HomeBase, Store {
  late final _$chatsAtom = Atom(name: 'HomeBase.chats', context: context);

  @override
  List<ChatModel> get chats {
    _$chatsAtom.reportRead();
    return super.chats;
  }

  @override
  set chats(List<ChatModel> value) {
    _$chatsAtom.reportWrite(value, super.chats, () {
      super.chats = value;
    });
  }

  late final _$HomeBaseActionController =
      ActionController(name: 'HomeBase', context: context);

  @override
  void addChats() {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.addChats');
    try {
      return super.addChats();
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chats: ${chats}
    ''';
  }
}

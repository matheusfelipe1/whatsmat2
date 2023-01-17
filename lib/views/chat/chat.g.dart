// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Chat on ChatBase, Store {
  late final _$messagesAtom = Atom(name: 'ChatBase.messages', context: context);

  @override
  List<Messages> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(List<Messages> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$chatSelectedAtom =
      Atom(name: 'ChatBase.chatSelected', context: context);

  @override
  ChatModel get chatSelected {
    _$chatSelectedAtom.reportRead();
    return super.chatSelected;
  }

  @override
  set chatSelected(ChatModel value) {
    _$chatSelectedAtom.reportWrite(value, super.chatSelected, () {
      super.chatSelected = value;
    });
  }

  @override
  String toString() {
    return '''
messages: ${messages},
chatSelected: ${chatSelected}
    ''';
  }
}

import 'package:appchat/models/message.dart';
import 'package:appchat/models/user.dart';
import 'package:appchat/repositorys/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/chat.dart';

class ChatController extends GetxController {
  final _repository = ChatRepository();
  final textEditingController = TextEditingController().obs;
  Chat chat;
  ChatController(this.chat);
  var messages = <Message>[].obs;

  createdMessage() async {
    var message = Message(
      description: textEditingController.value.text,
      authorUserName: User().name,
      date: DateTime.now(),
      authorUserId: User().id,
    );
    clear();
    messages.add(message);
    await _repository.create(chat, message);
  }

  clear() {
    textEditingController.value.clear();
  }

  getMessages() async {
    var data = await _repository.read(chat);
    if (data.isNotEmpty) {
      messages.value = data.map(
        (e) {
          final Timestamp timestamp = e['date'];
          return Message(
            id: e.id,
            description: e['description'],
            date: timestamp.toDate(),
            authorUserId: e['authorUserId'],
            authorUserName: e['authorUserName'],
          );
        },
      ).toList()
        ..sort((a, b) => a.date.isAfter(b.date) ? 1 : 0);
    }
  }

  deleteMessage(Message message) async {
    messages.remove(message);
    await _repository.delete(chat, message);
  }
}

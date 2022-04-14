import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chat.dart';
import '../models/message.dart';

class ChatRepository {
  delete(Chat chat, Message message) async {
    await FirebaseFirestore.instance
        .collection(chat.name)
        .doc(message.id)
        .delete();
  }

  create(Chat chat, Message message) async {
    await FirebaseFirestore.instance
        .collection(chat.name)
        .add(message.toJson());
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> read(
      Chat chat) async {
    try {
      return (await (FirebaseFirestore.instance.collection(chat.name)).get())
          .docs
          .toList();
    } catch (e) {
      return [];
    }
  }
}

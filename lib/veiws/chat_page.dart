import 'package:appchat/controllers/chat_controller.dart';
import 'package:appchat/models/chat.dart';
import 'package:appchat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatController controller;

  @override
  void initState() {
    super.initState();
    controller =
        Get.put(ChatController(Chat(name: Get.parameters['name'] ?? '')));
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        await controller.getMessages();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.parameters['name'] ?? ''),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 53, 91, 156),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 53, 91, 156),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 53, 91, 156),
              Color.fromARGB(255, 53, 91, 156),
              Color.fromARGB(255, 152, 176, 218),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Obx(
          () {
            return ListView.builder(
              itemCount: controller.messages.length,
              itemBuilder: (_, index) {
                var message = controller.messages[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: MessageWidget(
                    onLongPress: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('Deletar mensagem'),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () async {
                                controller.deleteMessage(message);
                                Get.back();
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        ),
                      );
                    },
                    message: message,
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomSheet: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: controller.textEditingController.value,
            decoration: InputDecoration(
              hintText: 'Escreva sua mensagem',
              suffixIcon: IconButton(
                onPressed: () async {
                  await controller.createdMessage();
                  controller.clear();
                },
                icon: const Icon(
                  Icons.send,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final Message message;
  final VoidCallback onLongPress;
  const MessageWidget(
      {Key? key, required this.message, required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => onLongPress(),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: message.authorUserId == User().id
              ? Colors.green[200]
              : Colors.white,
          borderRadius: message.authorUserId == User().id
              ? const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                )
              : BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.authorUserId == User().id
                    ? 'Você'
                    : message.authorUserName,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                message.description,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}

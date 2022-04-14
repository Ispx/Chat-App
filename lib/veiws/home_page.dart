import 'dart:io';

import 'package:appchat/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        backgroundColor: const Color.fromARGB(255, 53, 91, 156),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await AuthController().loggout();
                exit(0);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 80,
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Get.toNamed('/chat/sala1'),
                    title: const Text('Sala 1'),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  const Divider()
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 80,
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Get.toNamed('/chat/sala2'),
                    title: const Text('Sala 2'),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  const Divider()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

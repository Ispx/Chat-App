import 'package:appchat/veiws/chat_page.dart';
import 'package:appchat/veiws/home_page.dart';
import 'package:appchat/veiws/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/chat/:name',
          page: () => const ChatPage(),
        ),
        GetPage(
          name: '/',
          page: () => const LoginPage(),
        ),
      ],
    );
  }
}

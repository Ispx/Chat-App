import 'package:appchat/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.chat,
              size: 64,
              color: Colors.white,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Chat App',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: MaterialButton(
        height: 60,
        color: Colors.blue,
        elevation: 0.0,
        onPressed: () async {
          await authController.getAuth().then(
            (userCredential) {
              if (userCredential != null) {
                Get.offNamed('/home/');
              }
            },
          );
        },
        child: const Text(
          'Acessar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

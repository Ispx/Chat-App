import 'package:firebase_auth/firebase_auth.dart';

import '../repositorys/login_repository.dart';

class AuthController {
  UserCredential? userCredential;

  final _loginRepository = LoginRepository();
  factory AuthController() => _instance;
  static final AuthController _instance = AuthController._();
  AuthController._();
  Future<UserCredential?> getAuth() async {
    userCredential = await _loginRepository.signInWithGoogle();
    return userCredential;
  }

  Future<void> loggout() async {
    await FirebaseAuth.instance.signOut();
  }
}

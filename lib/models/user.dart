import '../controllers/auth_controller.dart';

class User {
  late String id;
  late String name;
  static final _instance = User._();
  factory User() => _instance;
  User._() {
    id = AuthController().userCredential!.user!.uid;
    name = AuthController().userCredential!.user!.displayName!;
  }
}

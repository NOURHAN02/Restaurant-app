import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<void> registerAccount({
    required emailAddress,
    required password,
    required name,
    required phone,
  }) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
    await userCredential.user?.updateDisplayName(name);
    userCredential.user?.providerData;
    await userCredential.user!.reload();
  }

  static Future<void> loginAccount({
    required emailAddress,
    required password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }

  static Future<void> sendAccountForgetPassword({required email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<void> logoutAccount() async {
    await FirebaseAuth.instance.signOut();
  }

  static User? getCurrentUSerAccount() {
    return FirebaseAuth.instance.currentUser;
  }
}

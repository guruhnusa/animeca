import 'package:animeca/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> authStatus() {
    return auth.authStateChanges();
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(email);
      print(password);
      Get.offAllNamed(Routes.DASHBOARD);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('An error occurred: ${e.message}');
      }
    }
  }

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  late UserCredential userCredential;

  void googleLogin() async {
    try {
      await _googleSignIn.signOut();
      _currentUser = await _googleSignIn.signIn();
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn == true) {
        final googleAuth = await _currentUser?.authentication;
        print("BERHASIL LOGIN");
        print("${_currentUser}");
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
        print(userCredential);
        Get.offAllNamed(Routes.DASHBOARD);
      }
    } catch (error) {}
  }
}

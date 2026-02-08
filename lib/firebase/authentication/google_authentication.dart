import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tingle/utils/utils.dart';

class GoogleAuthentication {
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final result = await FirebaseAuth.instance.signInWithCredential(credential);

      Utils.showLog("Google Authentication Response => $result");

      Utils.showLog("Google Authentication Name => ${result.user?.displayName}");
      Utils.showLog("Google Authentication Email => ${result.user?.email}");
      Utils.showLog("Google Authentication Image => ${result.user?.photoURL}");
      Utils.showLog("Google Authentication isNewUser => ${result.additionalUserInfo?.isNewUser}");

      return result;
    } catch (error) {
      Utils.showLog("Google Authentication Error => $error");
    }
    return null;
  }
}

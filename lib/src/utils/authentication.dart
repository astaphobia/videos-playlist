import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<FirebaseUser> isLoggedIn() {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<FirebaseUser> user = auth.currentUser();
  return user;
}

Future<FirebaseUser> signInByGoogle() async {
  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  FirebaseUser firebaseUser = await _auth.signInWithCredential(credential);
  return firebaseUser;
}

Future<FirebaseUser> signInByEmail(String email, String password) async {
  FirebaseUser user =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  return user;
}

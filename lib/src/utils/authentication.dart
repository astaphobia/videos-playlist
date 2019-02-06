// import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> isLoggedIn() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<FirebaseUser> user = auth.onAuthStateChanged;
  return user != null;
}

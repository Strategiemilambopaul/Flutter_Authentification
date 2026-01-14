import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "MOT DE PASSE";
      } else {
        return "UNE ERREUR S'EST PRODUITE $e";
      }
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return "Erreur de connexion: $e";
    }
  }
}

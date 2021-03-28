// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// class AuthenticationService {
//   FirebaseAuth _firebaseAuth; 
//   AuthenticationService(this._firebaseAuth);
//   Future<String> signIn(String email, String password) async {
//     try{
//       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       return "Signed In";
//     } catch(e) {
//       return e.message;
//     }
//   }
//   Future<String> signOut(String email, String password) async {
//      try{
//       await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//       return "Signed Out";
//     } catch(e) {
//       return e.message;
//     } 
//   }


// }
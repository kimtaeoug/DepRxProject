// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class GoogleLoginUtil{
//   static final GoogleLoginUtil _instance = GoogleLoginUtil._();
//   GoogleLoginUtil._();
//   factory GoogleLoginUtil() => _instance;
//
//   Future<String?> defaultGoogleLogin()async{
//     try{
//       GoogleSignIn googleSignIn = GoogleSignIn();
//       final GoogleSignInAccount? userData = await googleSignIn.signIn();
//       return userData?.id;
//       // return (await userData?.authentication)?.;
//     }catch(e){
//       return e.toString();
//     }
//   }
//   Future<String?> firebaseLogin1()async{
//     String result = 'firebaseLogin1()';
//     try{
//       GoogleSignIn googleSignIn = GoogleSignIn();
//       result += '1\n';
//       final GoogleSignInAccount? userData = await googleSignIn.signIn();
//       result += '2\n';
//       final GoogleSignInAuthentication? auth = await userData?.authentication;
//       result += '3\n';
//       var credential = GoogleAuthProvider.credential(accessToken: auth?.accessToken, idToken: auth?.idToken);
//       result += '4\n';
//       UserCredential? userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//       return userCredential.user?.uid;
//     }catch(e){
//       result += e.toString();
//     }
//     return result;
//   }
//   Future<String?> firebaseLogin2()async{
//     String result = 'firebaseLogin2()';
//     try{
//       GoogleSignIn googleSignIn = GoogleSignIn(clientId: '13402534043-voobnphnlgvm04krlb8kpjqsseo089au.apps.googleusercontent.com');
//       result += '1\n';
//       final GoogleSignInAccount? userData = await googleSignIn.signIn();
//       result += '2\n';
//       final GoogleSignInAuthentication? auth = await userData?.authentication;
//       result += '3\n';
//       var credential = GoogleAuthProvider.credential(accessToken: auth?.accessToken, idToken: auth?.idToken);
//       result += '4\n';
//       UserCredential? userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//       return userCredential.user?.uid;
//     }catch(e){
//       result += e.toString();
//     }
//     return result;
//   }
//   Future<String?> firebaseLogin3()async{
//     String result = 'firebaseLogin3()';
//     try{
//       GoogleSignIn googleSignIn = GoogleSignIn(clientId: '13402534043-2sfj7s4s8hssen9hlevjvbvvu7tdg5a8.apps.googleusercontent.com');
//       result += '1\n';
//       final GoogleSignInAccount? userData = await googleSignIn.signIn();
//       result += '2\n';
//       final GoogleSignInAuthentication? auth = await userData?.authentication;
//       result += '3\n';
//       var credential = GoogleAuthProvider.credential(accessToken: auth?.accessToken, idToken: auth?.idToken);
//       result += '4\n';
//       UserCredential? userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//       return userCredential.user?.uid;
//     }catch(e){
//       result += e.toString();
//     }
//     return result;
//   }
//   Future<String?> firebaseLogin4()async{
//     String result = 'firebaseLogin4()';
//     try{
//       GoogleSignIn googleSignIn = GoogleSignIn(clientId: '662325643039-kkotkpfq1sjvbh05ur05fkleq4g4b5hb.apps.googleusercontent.com');
//       result += '1\n';
//       final GoogleSignInAccount? userData = await googleSignIn.signIn();
//       result += '2\n';
//       final GoogleSignInAuthentication? auth = await userData?.authentication;
//       result += '3\n';
//       var credential = GoogleAuthProvider.credential(accessToken: auth?.accessToken, idToken: auth?.idToken);
//       result += '4\n';
//       UserCredential? userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//       return userCredential.user?.uid;
//     }catch(e){
//       result += e.toString();
//     }
//     return result;
//   }
// }
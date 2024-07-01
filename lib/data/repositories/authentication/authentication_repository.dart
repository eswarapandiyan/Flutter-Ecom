import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/features/authentication/screens/login/login.dart';
import 'package:my_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:my_store/features/authentication/screens/register/verify_email.dart';
import 'package:my_store/navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(const BottomNavigationMenu());
      } else {
        Get.offAll(VerifyEmail(
          email: _auth.currentUser?.email,
        ));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      bool checkIfFirstTime = deviceStorage.read('isFirstTime');
      checkIfFirstTime != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }

  // Future<UserCredential> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     // UserCredential userData = await _auth.createUserWithEmailAndPassword(
  //     //     email: email, password: password);
  //     // return userData;

  //     return await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);

  //     /// we are store the value of the user credential in fire store
  //   } on FirebaseAuthException catch (e) {
  //     return CustomLoaders.errorSnackBar(
  //         title: 'FireStore Exception!', message: e.toString());
  //   }
  // }

  /// Register with email and password     ---  REGISTER
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'FireStore Exception!  --- REGISTER', message: e.toString());
      return null;
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
      return null;
    }
  }

  /// Login with email and Password      -   LOGIN
  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'FireStore Exception! --- LOGIN', message: e.toString());
      return null;
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
      return null;
    }
  }

  /// Login with Google   ---- Google Signin
  Future<UserCredential?> signInWithGoogle() async {
    try {
      /// Trigger the Authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      /// obtain the auth details from the user
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      ///create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      /// Once signed in return the user credential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      return CustomLoaders.errorSnackBar(
          title: 'SignIn google Exception! --- Google-signin',
          message: e.toString());
    } catch (e) {
      return CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
    }
  }

  /// Send Email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Send Email Exception!', message: e.toString());
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
    }
  }

  /// LogOut
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'SignOut Exception!', message: e.toString());
    } catch (e) {
      return CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if login was successful
      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.tokenString);

        // Once signed in, return the UserCredential
        return await _auth.signInWithCredential(credential);
      } else {
        CustomLoaders.errorSnackBar(
            title: 'Facebook Sign-In Failed',
            message: 'Status: ${result.status}, Message: ${result.message}');
        return null;
      }
    } on FirebaseAuthException catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Facebook Sign-In Exception!', message: e.toString());
      return null;
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
      return null;
    }
  }
}

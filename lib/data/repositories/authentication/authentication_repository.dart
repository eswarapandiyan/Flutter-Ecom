import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'FireStore Exception!', message: e.toString());
      return null;
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
      return null;
    }
  }

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

  Future<void> logout() async {
    try {
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
}

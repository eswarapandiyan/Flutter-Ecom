import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_store/features/authentication/screens/login/login.dart';
import 'package:my_store/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('isFirstTime', true);
    bool checkIfFirstTime = deviceStorage.read('isFirstTime');
    checkIfFirstTime != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => OnBoardingScreen());
  }
}

import 'package:alheimer/services/authentication.dart';
import 'package:alheimer/views/auth/login_screen/login_screen.dart';
import 'package:alheimer/views/home/start_analyze_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 4), () async{
      if(await Auth().isUserLoggedIn() == true) {
        Get.offAll(()=>  const StartAnalyzeScreen());
      } else {
        Get.offAll(()=>  const LoginScreen());
      }
    });
  }
}

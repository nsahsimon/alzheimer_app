import 'package:alheimer/controllers/get_storage/get_storage_controller.dart';
import 'package:alheimer/views/auth/login_screen/loginController.dart';
import 'package:alheimer/views/auth/reset_password_screen/resetPasswordController.dart';
import 'package:alheimer/views/auth/sign_up_screen/sign_up_controller.dart';
import 'package:get/get.dart';


import '../views/splash/splash_controller.dart';

class InitializingControllers implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => GetStorageController(), fenix: true);

  }
}

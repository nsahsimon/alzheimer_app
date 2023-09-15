import 'package:alheimer/services/authentication.dart';
import 'package:alheimer/views/home/start_analyze_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxDouble emailfieldHeight=40.0.obs;
  RxDouble  passwordHeight=40.0.obs;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;


  Future<void> loginButtonFunction({required String email, required String password}) async{
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      bool successfullyLoggedIn = await Auth().loginUser(email: email, password: password);
      if(successfullyLoggedIn == true) {
        Get.to(()=> const StartAnalyzeScreen());
      }
    } else
      if (kDebugMode) {
        print("not ok");
      }
  }

  String? validateName(String value) {
    if (value == '') {
      return "Enter your name";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      passwordHeight.value=60.0;
      return 'Please enter password';

    }
    passwordHeight.value=40.0;
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  @override
  void onClose() {
    loginFormKey.currentState?.dispose(); // Dispose of the GlobalKey
    super.onClose();
  }
}

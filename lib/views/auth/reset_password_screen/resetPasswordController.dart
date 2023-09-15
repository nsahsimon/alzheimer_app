import 'package:alheimer/services/authentication.dart';
import 'package:alheimer/views/auth/login_screen/login_screen.dart';
import 'package:alheimer/views/home/start_analyze_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  RxDouble emailfieldHeight=40.0.obs;
  RxDouble  passwordHeight=40.0.obs;

  GlobalKey<FormState> passwordResetFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;


  Future<bool?> passwordResetButtonFunction({required String email}) async{
    final isValid = passwordResetFormKey.currentState!.validate();
    if (isValid) {
      bool successfullyResetPassword = await Auth().resetPassword(email);
      return successfullyResetPassword;
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
    passwordResetFormKey.currentState?.dispose(); // Dispose of the GlobalKey
    super.onClose();
  }
}

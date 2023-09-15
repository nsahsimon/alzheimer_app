import 'package:alheimer/services/authentication.dart';
import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/views/home/start_analyze_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  DateTime selectedDate = DateTime.now();
 var selectedDateForm='Date of Birth DD/MM/YY';

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kButtonColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      selectedDateForm=selectedDate.toString().split(' ')[0];
    }
    update();
  }

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  Future<void> registerButtonFunction ({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
    required String dob,
    required String phoneNumber
  }) async{
    final isValid = signUpFormKey.currentState!.validate();
    if (isValid) {
      bool successfullySignedUp = await Auth().registerUser(
          email: email,
          password: password,
          username: username,
          firstName: firstName,
          lastName: lastName,
          dob: dob,
          phoneNumber: phoneNumber
      );
      if(successfullySignedUp == true) {
        Get.to(()=> const StartAnalyzeScreen());
      }
    } else if (kDebugMode) {
      print("not ok");
    }
  }

  String? validateName(String value) {
    if (value == '') {
      return "Enter your name";
    }
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


  String? validateSurName(String value) {
    if (value == '') {
      return "Enter your name";
    }
    return null;
  }

  String? validateNumber(String value) {
    if (value == '') {
      return "Enter your Number";
    }
    return null;
  }


  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';

    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';

    }
    else if(value.isNotEmpty && value!=passwordController.text){
      return 'Please doesn\'t match';
    }
    return null;
  }
  @override
  void onClose() {
    signUpFormKey.currentState?.dispose(); // Dispose of the GlobalKey
    super.onClose();
  }
}

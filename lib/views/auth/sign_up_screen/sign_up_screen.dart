import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/utills/appCommonComponents.dart';
import 'package:alheimer/utills/appExtensions.dart';
import 'package:alheimer/utills/appStyles.dart';
import 'package:alheimer/views/auth/login_screen/login_screen.dart';
import 'package:alheimer/views/auth/sign_up_screen/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isLoading = false;
  void startLoading() {
    setState((){
      isLoading = true;
    });
  }

  void stopLoading (){
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    final controller = Get.find<SignUpController>();


    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: mediaSize.height,
            width: mediaSize.width,
            color: kBackgroundColor,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: controller.signUpFormKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    30.ph,
                    const Center(
                        child: Text(
                      'CREATE AN ACCOUNT',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    )),
                    20.ph,
                    kCustomTextField(
                      onChanged: (value) {},
                      label: 'First Name',
                      validator: (value) {
                        return controller.validateName(value);
                      },
                      controller: controller.firstnameController,
                    ),
                    12.ph,
                    kCustomTextField(
                      onChanged: (value) {},
                      label: 'Last Name',
                      validator: (value) {
                        return controller.validateName(value);
                      },
                      controller: controller.lastNameController,
                    ),
                    12.ph,
                    kCustomTextField(
                      onChanged: (value) {},
                      label: 'Username',
                      validator: (value) {
                        return controller.validateName(value);
                      },
                      controller: controller.usernameController,
                    ),
                    12.ph,
                    kCustomTextField(
                      onChanged: (value) {},
                      label: 'Email',
                      validator: (value) {
                        return controller.validateEmail(value);
                      },
                      controller: controller.emailController,
                    ),
                    12.ph,
                    kCustomTextField(
                      onChanged: (value) {},
                      label: 'Password',
                      validator: (value) {
                        return controller.validatePassword(value);
                      },
                      controller: controller.passwordController,
                    ),
                    12.ph,
                    // kCustomTextField(
                    //   onChanged: (value) {},
                    //   label: 'Confirm Password',
                    //   validator: (value) {
                    //     return controller.validateConfirmPassword(value);
                    //   },
                    //   controller: controller.confirmPassController,
                    // ),
                    // 12.ph,
                    kCustomTextField(
                      onChanged: (value) {},
                      label: 'Confirm Password',
                      validator: (value) {
                        return controller.validateConfirmPassword(value);
                      },
                      controller: controller.confirmPassController,
                    ),
                    12.ph,
                    GetBuilder<SignUpController>(builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectDate(context);
                        },
                        child: Container(
                          width: mediaSize.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(controller.selectedDateForm,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      );
                    }),
                    12.ph,
                    kCustomTextField(
                      onChanged: (value) {},
                      label: 'Phone Number',
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        return controller.validateNumber(value);
                      },
                      controller: controller.phoneController,
                    ),
                    20.ph,
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: kCustomButton(
                        textStyle: const TextStyle(color: Colors.white),
                        onPressFunction: () async{
                          startLoading();
                          try {
                            await controller.registerButtonFunction(
                                email: controller.emailController.text,
                                password: controller.passwordController.text,
                                firstName: controller.firstnameController.text,
                                lastName: controller.lastNameController.text,
                                username: controller.usernameController.text,
                                dob: controller.selectedDate.toString(),
                                phoneNumber: controller.phoneController.text
                            );
                          }catch(e) {
                            debugPrint("$e");
                          }
                          stopLoading();
                        },
                        text: 'REGISTER',
                        backgroundColor: kButtonColor,
                        width: mediaSize.width / 2.5,
                      ),
                    ),
                    12.ph,
                    GestureDetector(
                      onTap: () {
                        Get.off(() => const LoginScreen());
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(color: kButtonColor, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

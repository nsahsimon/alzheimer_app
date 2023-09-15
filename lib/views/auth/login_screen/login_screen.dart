import 'package:alheimer/generated/assets.dart';
import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/utills/appCommonComponents.dart';
import 'package:alheimer/utills/appExtensions.dart';
import 'package:alheimer/utills/appStyles.dart';
import 'package:alheimer/views/auth/login_screen/loginController.dart';
import 'package:alheimer/views/auth/reset_password_screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  void startLoading() {
    setState((){
      isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    final controller = Get.find<LoginController>();
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
              key: controller.loginFormKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: mediaSize.height-40,
                  width: mediaSize.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset(Assets.assetsLogo),
                        ),
                      ),
                      Column(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          kCustomTextField(
                            textInputType: TextInputType.emailAddress,
                            label: 'Email',
                            onChanged: (value) {},
                            validator: (value) {
                              return controller.validateEmail(value);
                            },
                            controller: controller.emailController,
                          ),
                          10.ph,
                          kCustomTextField(
                            label: 'Password',
                            onChanged: (value) {},
                            validator: (value) {
                              return controller.validatePassword(value);
                            },
                            controller: controller.passwordController,
                          ),
                          15.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.to(()=> const ResetPasswordScreen());
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      color: kButtonColor,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          15.ph,
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: kCustomButton(
                                    onPressFunction: () {
                                      Get.to(()=> const SignUpScreen());
                                    },
                                    text: 'First Time Login',
                                    textStyle: const TextStyle(color: kButtonColor),
                                    backgroundColor: Colors.white,
                                    borderColor: kButtonColor,
                                  )),
                              10.pw,
                              Expanded(
                                flex: 1,
                                child: kCustomButton(
                                  textStyle: const TextStyle(color: Colors.white),
                                  onPressFunction: () async{
                                    startLoading();
                                    try {
                                      await controller.loginButtonFunction(
                                          email: controller.emailController.text,
                                          password: controller.passwordController.text
                                      );
                                    }catch(e) {
                                      debugPrint("$e");
                                    }
                                    stopLoading();
                                  },
                                  text: 'Login',
                                  width: mediaSize.width,
                                  backgroundColor: kButtonColor,
                                ),
                              ),
                            ],
                          ),
                          10.ph,
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


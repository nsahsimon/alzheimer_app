import 'package:alheimer/generated/assets.dart';
import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/utills/appCommonComponents.dart';
import 'package:alheimer/utills/appExtensions.dart';
import 'package:alheimer/utills/appStyles.dart';
import 'package:alheimer/views/auth/login_screen/loginController.dart';
import 'package:alheimer/views/auth/reset_password_screen/resetPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../sign_up_screen/sign_up_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
    final controller = Get.find<ResetPasswordController>();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Reset Password")
        ),
        body: SafeArea(
          child: Container(
            height: mediaSize.height,
            width: mediaSize.width,
            color: kBackgroundColor,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: controller.passwordResetFormKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: mediaSize.height-40,
                  width: mediaSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      15.ph,
                      Text(
                          "We will send a password reset link to the registered email address you will provide below."
                      ),
                      15.ph,
                      kCustomTextField(
                        textInputType: TextInputType.emailAddress,
                        label: 'Email',
                        onChanged: (value) {},
                        validator: (value) {
                          return controller.validateEmail(value);
                        },
                        controller: controller.emailController,
                      ),

                      15.ph,
                      Row(
                        children: [

                          Expanded(
                            flex: 1,
                            child: kCustomButton(
                              textStyle: const TextStyle(color: Colors.white),
                              onPressFunction: () async{
                                startLoading();
                                try {
                                  bool? result = await controller.passwordResetButtonFunction(
                                      email: controller.emailController.text,
                                  );

                                  if(result == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Reset link sent. Check your email"), backgroundColor: Colors.black,)
                                    );
                                  }
                                }catch(e) {
                                  debugPrint("$e");
                                }
                                stopLoading();
                              },
                              text: 'Reset Password',
                              width: mediaSize.width,
                              backgroundColor: kButtonColor,
                            ),
                          ),
                        ],
                      ),
                      10.ph,
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


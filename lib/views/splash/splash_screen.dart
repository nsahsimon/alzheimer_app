import 'package:alheimer/utills/appCommonComponents.dart';
import 'package:alheimer/views/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.find<SplashController>();
    Size mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
            height: mediaSize.height,
            width: mediaSize.width,
            padding: EdgeInsets.symmetric(horizontal: 40),
            color: const Color(0xffF5F5F5),
            child: CustomSlideFadeTransition(
                child: Image.asset(Assets.assetsLogo))),
      ),
    );
  }
}

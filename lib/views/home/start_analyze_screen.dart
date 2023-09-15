import 'package:alheimer/generated/assets.dart';
import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/utills/appCommonComponents.dart';
import 'package:alheimer/utills/appExtensions.dart';
import 'package:alheimer/utills/appStyles.dart';
import 'package:alheimer/views/home/home_analyze_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartAnalyzeScreen extends StatelessWidget {
  const StartAnalyzeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: mediaSize.height,
          width: mediaSize.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: kBackgroundColorStartAnalyze,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.assetsLogo,
                height: 170,
                width: 170,
              ),
              40.ph,
              FutureBuilder(
                future: db.collection('users').doc(auth.currentUser!.uid).get(),
                builder: (context, snapshot) {

                  if(snapshot.data == null || snapshot.hasError || snapshot.hasData == false) {
                    return Container();
                  }

                  String username = (snapshot.data!.data() as Map<String , dynamic>)['username'];

                  return Text(
                    'WELCOME $username!',
                    style: AppStyle.heading25,
                  );
                }
              ),
              50.ph,
              kCustomButton(
                height: mediaSize.height*0.1,
                width: mediaSize.width,
                onPressFunction: () {
                  Get.offAll(()=> HomeAnalyzeScreen());
                },
                text: 'START ANALYZE',
                textStyle: AppStyle.buttonStyle,
                backgroundColor: kButtonColorStartAnalyze,
              )
            ],
          ),
        ),
      ),
    );
  }
}

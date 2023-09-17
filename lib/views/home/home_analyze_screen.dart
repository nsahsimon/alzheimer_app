import 'package:alheimer/generated/assets.dart';
import 'package:alheimer/services/ai_service.dart';
import 'package:alheimer/services/authentication.dart';
import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/utills/appCommonComponents.dart';
import 'package:alheimer/utills/appExtensions.dart';
import 'package:alheimer/utills/appStyles.dart';
import 'package:alheimer/views/auth/login_screen/login_screen.dart';
import 'package:alheimer/views/home/word_usage_report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeAnalyzeScreen extends StatefulWidget {
  HomeAnalyzeScreen({super.key});

  @override
  State<HomeAnalyzeScreen> createState() => _HomeAnalyzeScreenState();
}

class _HomeAnalyzeScreenState extends State<HomeAnalyzeScreen> {

  TextEditingController imageDescriptionController = TextEditingController();
  bool isLoading = false;

  void startLoading() {
    setState((){
      isLoading = true;
    });
  }

  void stopLoading() {
    setState((){
      isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.logout, color: Colors.red,),
              tooltip: "logout",
              onPressed: () {
                Auth().signOut().then((result) {
                  Get.offAll(()=>  const LoginScreen());
                });
              },
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 5, color: Colors.grey.shade400, offset: Offset(0, 5))],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          height: 80,
          child: Center(
            child: Image.asset(
              Assets.assetsHome,
              height: 50,
              width: 50,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: mediaSize.height,
            width: mediaSize.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: kBackgroundColorStartAnalyze,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                40.ph,
                Image.asset(
                  'assets/image.png',
                  height: mediaSize.height * 0.25,
                  width: mediaSize.width,
                  fit: BoxFit.fill,
                ),
                40.ph,
                Container(
                  height: mediaSize.height * 0.25,
                  width: mediaSize.width,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: kButtonColorStartAnalyzeLite,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextField(
                    controller: imageDescriptionController,
                    maxLines: 1000,
                    decoration: InputDecoration(
                      hintText: 'Please describe the images in as many words as you can.......',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                30.ph,
                kCustomButton(
                  height: mediaSize.height * 0.09,
                  width: mediaSize.width / 2,
                  onPressFunction: () async{
                    if(imageDescriptionController.text == "")  {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("Please a description for the image", style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.black,
                        )
                      );
                      return;
                    }
                    startLoading();
                    var result = await AIService().processText(imageDescriptionController.text);
                    stopLoading();
                    if(result != null) {
                      try {
                        double misspelling = result['misspelled_words'];
                        double simplifiedPhrases = result['phrases'];
                        double repeatedWords = result['repeated_words'];
                        Get.to(() => WordUsageReportScreen(
                            misspelling: misspelling,
                            simplifiedPhrases: simplifiedPhrases,
                            repeatedWords: repeatedWords
                        ));
                      }catch(e) {
                        debugPrint("$e");
                        debugPrint("Map from Chatgpt contains invalid fields");
                        stopLoading();
                        return;
                      }

                    }
                  },
                  text: 'Analyze',
                  textStyle: AppStyle.buttonStyle,
                  backgroundColor: kButtonColorStartAnalyzeLite,
                ),
                20.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

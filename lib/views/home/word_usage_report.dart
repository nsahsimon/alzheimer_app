


import 'package:alheimer/generated/assets.dart';
import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/utills/appCommonComponents.dart';
import 'package:alheimer/utills/appExtensions.dart';
import 'package:alheimer/utills/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'result_analyze.dart';

class WordUsageReportScreen extends StatelessWidget {
  const WordUsageReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 5,
                color: Colors.grey.shade400,
                offset: Offset(0,5)
            )
          ],
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),),
        ),
        height: 80,
        child: Center(child: Image.asset(Assets.assetsHome,height: 50,width: 50,),),
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
              kUsageReportWidget(mediaSize: mediaSize,title: 'Misspelling',value: '15'),
              kUsageReportWidget(mediaSize: mediaSize,title: 'Repeated words',value: '5'),
              kUsageReportWidget(mediaSize: mediaSize,title: 'Simplified phrases',value: '15'),
              30.ph,
              kCustomButton(
                height: mediaSize.height*0.11,
                width: mediaSize.width,
                onPressFunction: () {
                  Get.to(()=> ResultAnalyzeScreen());
                },
                text: 'LOW RISK',
                textStyle: TextStyle(color: Color(0xffE5E5E5),fontSize: 28,fontWeight: FontWeight.w700),
                backgroundColor: kGreenButtonColor,
              ),
              30.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFCFC),
                      border: Border.all(color: Colors.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image.asset(Assets.assetsPrint,),
                  ),
                  10.pw,
                  Container(
                    height: 70,
                    width: 70,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xffFFFCFC),
                        border: Border.all(color: Colors.black.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image.asset(Assets.assetsDownload,),
                  )
                ],
              ),
              20.ph,
            ],
          ),
        ),
      ),
    );
  }
}

class kUsageReportWidget extends StatelessWidget {
  const kUsageReportWidget({
    super.key,
    required this.mediaSize,
    required this.title,
    required this.value,
  });

  final Size mediaSize;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaSize.height*0.1,
      width: mediaSize.width,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(20),
       boxShadow: [
         BoxShadow(
           color: Colors.grey.shade200,
           blurRadius: 5,
           spreadRadius: 5,
           offset: Offset(0,3)
         )
       ]
     ),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(color: Colors.black,fontSize: 24),),
          Text('$value%',style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

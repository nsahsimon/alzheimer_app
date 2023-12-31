



import 'package:alheimer/generated/assets.dart';
import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/utills/appCommonComponents.dart';
import 'package:alheimer/utills/appExtensions.dart';
import 'package:alheimer/utills/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultAnalyzeScreen extends StatelessWidget {
  final double risk;
  const ResultAnalyzeScreen({required this.risk});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    double progressLength = mediaSize.width * 0.6;

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
          color: kBackgroundColorStartAnalyze,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              40.ph,
              Text('Based on our analysis,\nyou are', textAlign: TextAlign.center, style: TextStyle(fontSize: 22,),),
              Text(risk < 50 ? 'LOW RISK' : 'HIGH RISK',style: TextStyle(fontSize: 42,color: risk < 50 ? kGreenButtonColor : Colors.red,fontWeight: FontWeight.bold),),
              30.ph,
              Container(
                height: 30,
                width: progressLength,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                child: Stack(
                  children: [
                  Container(
                  height: 30,
                  width: progressLength * risk / 100,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  )
                  ),
                    Center(child: Text(risk.toStringAsFixed(2)+'%'),),
                  ],
                ),
              ),
              30.ph,
              // Container(
              //   height: 70,
              //   width: 70,
              //   padding: EdgeInsets.all(15),
              //   decoration: BoxDecoration(
              //       color: Color(0xffFFFCFC),
              //       border: Border.all(color: Colors.black.withOpacity(0.5)),
              //       borderRadius: BorderRadius.circular(20)
              //   ),
              //   child: Image.asset(Assets.assetsDownload,),
              // ),
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

import 'package:alheimer/utills/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppStyle {

  static  TextStyle subtitle15 = const TextStyle(
    fontSize: 15,
    color:  kBlackColor,
  );

  static  TextStyle subtitle12 = const TextStyle(
    fontSize: 12,
    color:kBlackColor,
  );
  //
  static  TextStyle subtitle8 = const TextStyle(
    fontSize: 8,
    color:kBlackColor,
  );
  static  TextStyle heading25 = const TextStyle(
    fontSize: 25,
    color:kBlackColor,
    fontWeight: FontWeight.w600
  );
  static  TextStyle heading1 = const TextStyle(
    fontSize: 20,
    color:kBlackColor,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle heading18 = const TextStyle(
    fontSize: 18,
    color:kBlackColor,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle heading16 = const TextStyle(
    fontSize: 16,
    color:kBlackColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle greyText=TextStyle(color: Colors.grey);
  static const TextStyle greyTextBold=TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15);
  static const TextStyle greyText13=TextStyle(color: Colors.grey,fontSize: 13);
  static const TextStyle blackTextBold20=TextStyle(color: kBlackColor,fontWeight: FontWeight.w500,fontSize: 20);

  static const TextStyle buttonStyle=TextStyle(
  fontSize: 20,
  fontFamily: 'CenturyGothic',
  color: Colors.white,
  );
  static const TextStyle buttonStyleSmall=TextStyle(
    fontSize: 16,
    fontFamily: 'CenturyGothic',
    color: Colors.white,
  );
  static const TextStyle redStyle=TextStyle(
    fontSize: 14,
    fontFamily: 'CenturyGothic',
    color: kButtonColor,
  );
}



import 'dart:async';
import 'package:alheimer/utills/appColors.dart';
import 'package:alheimer/utills/appExtensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



class kCustomButton extends StatelessWidget {
  final  onPressFunction;
  final String text;
  final double height;
  final double width;
  final Color borderColor;
  final Color backgroundColor;
  final  textStyle;
  final icon;
  final bool isIcon;

  const kCustomButton(
      {Key? key,
        required this.onPressFunction,
        required this.text,
        this.borderColor=Colors.transparent,
        this.backgroundColor=Colors.white,
        this.icon,
        required this.textStyle,
         this.isIcon=false,
        this.height = 40,
        this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressFunction,
      style: ElevatedButton.styleFrom(

        elevation: 0.5,
        fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor,width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: backgroundColor),
      child:  Center(
        child: Text(
          text,
          style:  textStyle,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

/*
class kPhoneField extends StatelessWidget {
  final onChangeFunction;
  const kPhoneField({super.key, 
    required this.onChangeFunction
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      showDropdownIcon: true,
      autofocus: false,
      showCursor: true,
      dropdownIconPosition: IconPosition.trailing,
      cursorColor: Colors.black,
      enabled: true,
      dropdownTextStyle: const TextStyle(fontSize: 17
      ),
      dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 30,),
      flagsButtonMargin: const EdgeInsets.only(left: 10),
      style:
      const TextStyle(
        color: Colors.black, fontSize: 17,),
      decoration: InputDecoration(
        filled: true,
        isCollapsed: true,
        contentPadding: const EdgeInsets.only(
            top: 25, bottom: 25, left: 1),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: kBorderBlackColor,width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: kBorderBlackColor,width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.red,width: 2)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.red,width: 2)),
        border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: kBorderBlackColor,width: 2)),
      ),
      initialCountryCode: 'PK',
      onChanged:onChangeFunction,
    );
  }
}
*/

/*
class kOtpPinField extends StatelessWidget {
  final onChange;
  final onSubmit;

  const kOtpPinField({super.key, 
    required this.onChange,
    required this.onSubmit
  });

  @override
  Widget build(BuildContext context) {
    return OtpPinField(
      otpPinFieldInputType: OtpPinFieldInputType.none,
      onChange: onChange,
      onSubmit: onSubmit,
      otpPinFieldStyle: const OtpPinFieldStyle(
          defaultFieldBorderColor: kBorderBlackColor,
          activeFieldBorderColor: kBorderBlackColor,
          defaultFieldBackgroundColor: kScaffoldBackground,
          fieldBorderRadius: 20,
          fieldPadding:20,
          fieldBorderWidth: 0.3,
          activeFieldBackgroundColor: kScaffoldBackground,
          textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35)),
      maxLength: 4,
      highlightBorder: true,
      fieldWidth: 60,
      cursorColor: Colors.black,
      fieldHeight: 60,
      otpPinFieldDecoration:
      OtpPinFieldDecoration.defaultPinBoxDecoration,
    );
  }
}
*/


class kCustomTextField extends StatelessWidget {
  final validator;
  final onChanged;
  final obsecure;
  bool autofocus;
  final TextEditingController controller;
  final  label;

  final TextInputType textInputType;

  kCustomTextField({required this.validator,
    required this.controller,
    required this.onChanged,
    this.label,
    this.autofocus=false,
    // required this.hintText,
    this.obsecure = false,
    this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: kBlackColor,fontSize: 16,fontWeight: FontWeight.w500),
      validator: validator,
      obscureText: obsecure,
      keyboardType: textInputType,
      onChanged: onChanged,
      autofocus: autofocus,
      controller: controller,
      cursorColor: kButtonColor,
      decoration: InputDecoration(
          filled: true,
          hintText: label,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          alignLabelWithHint: true,
          hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),
          fillColor: Colors.transparent,
          errorStyle: const TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w500),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBlackColor),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBlackColor),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: kBlackColor),

          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          contentPadding:
          const EdgeInsets.only(left: 20,top: 15,bottom: 15,),
          // hintText: hintText,
          // hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15,fontWeight: FontWeight.w500)
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: kwhitethemeColor)),
      ),
    );
  }
}

class CustomSlideFadeTransition extends StatefulWidget {
  ///The child on which to apply the given [CustomSlideFadeTransition]
  final Widget child;

  ///The offset by which to slide and [child] into view from [Direction].
  ///Defaults to 0.2
  final double offset;

  ///The curve used to animate the [child] into view.
  ///Defaults to [Curves.easeIn]
  final Curve curve;

  ///The direction from which to animate the [child] into view. [Direction.horizontal]
  ///will make the child slide on x-axis by [offset] and [Direction.vertical] on y-axis.
  ///Defaults to [Direction.vertical]
  final direction;

  ///The delay with which to animate the [child]. Takes in a [Duration] and
  /// defaults to 0.0 seconds
  final Duration delayStart;

  ///The total duration in which the animation completes. Defaults to 800 milliseconds
  final Duration animationDuration;

  CustomSlideFadeTransition({
    required this.child,
    this.offset = 1.2,
    this.curve = Curves.bounceIn,
    this.direction = Axis.vertical,
    this.delayStart = const Duration(microseconds: 0),
    this.animationDuration = const Duration(milliseconds: 1500),
  });

  @override
  _CustomSlideFadeTransitionState createState() =>
      _CustomSlideFadeTransitionState();
}

class _CustomSlideFadeTransitionState extends State<CustomSlideFadeTransition>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;

  late AnimationController _animationController;

  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    //configure the animation controller as per the direction
    if (widget.direction == Axis.vertical) {
      _animationSlide =
          Tween<Offset>(begin: Offset(0, widget.offset), end: const Offset(0, 0))
              .animate(CurvedAnimation(
            curve: widget.curve,
            parent: _animationController,
          ));
    } else {
      _animationSlide =
          Tween<Offset>(begin: Offset(widget.offset, 0), end: const Offset(0, 0))
              .animate(CurvedAnimation(
            curve: widget.curve,
            parent: _animationController,
          ));
    }

    _animationFade =
        Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
          curve: widget.curve,
          parent: _animationController,
        ));

    Timer(widget.delayStart, () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationFade,
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}


class kSimpleTextField extends StatelessWidget {
  const kSimpleTextField({
    super.key,
    required this.isDark,
    required this.label,
    required this.maxLines,
    required this.inputType,
    required this.editingController,
  });

  final bool isDark;
  final String? label;
  final int maxLines;
  final TextInputType inputType;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: TextField(
        style:  const TextStyle(color: kBlackColor,fontSize: 16,fontWeight: FontWeight.w500),
        autofocus: false,
        controller: editingController,
        cursorColor: kButtonColor,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration:  InputDecoration(
          filled: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Center(child: Text(label.toString(),style: context.theme.textTheme.bodyMedium,)),
          alignLabelWithHint: true,
          fillColor:Colors.transparent,
          errorStyle: const TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w500),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent),

          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding:
          const EdgeInsets.only(left: 10,top: 10,bottom: 10,),
          // hintText: hintText,
          // hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15,fontWeight: FontWeight.w500)
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: kwhitethemeColor)),
        ),
      ),
    );
  }
}

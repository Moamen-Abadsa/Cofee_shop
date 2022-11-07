import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class my_elevated_button extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double fontSize;
  final double height;
  final double width;
  final double raduis;
  final String fontFamily;

  my_elevated_button({required this.text,required this.onPressed ,  this.fontSize = 16 ,this.width = double.infinity ,this.height = 48 , this.raduis = 6 , this.fontFamily = "Work Sans"});



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(raduis.r),
          ),
        ),
        primary: Constants.primaryColor,
        minimumSize: Size(width.w, height.h),
      ),
      onPressed: onPressed,
      child: Text(
        "$text",
        style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}

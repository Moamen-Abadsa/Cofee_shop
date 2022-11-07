import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/constants.dart';

class myMenuItem extends StatelessWidget {
  final String text;
  final bool isVisibl;
  final void Function() onPressed;

  myMenuItem(
      {required this.text, required this.isVisibl, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      child: Row(
        children: [
          Visibility(
            visible: isVisibl,
            maintainState: true,
            maintainSize: true,
            maintainAnimation: true,
            child: Container(
              height: 30.h,
              width: 2.w,
              decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.r))),
            ),
          ),
          SizedBox(
            width: 7.w,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "$text",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Work sans",
                color: isVisibl ? Constants.primaryColor : Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

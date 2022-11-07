import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContactsInformation extends StatelessWidget {
  final String firstHeader;
  final String firstText;
  final String secondText;
  final String pathOfSvg;

  ContactsInformation(
      {required this.firstHeader,
      required this.firstText,
      required this.secondText,
      required this.pathOfSvg});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.borderGreyColor2,
                  width: 1.w,
                )),
            child: SvgPicture.asset(
              pathOfSvg,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstHeader,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Work Sans",
                    color: Constants.primaryColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                firstText,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Work Sans",
                    color: Constants.blackColor),
              ),
              Text(
                secondText,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Work Sans",
                    color: Constants.blackColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

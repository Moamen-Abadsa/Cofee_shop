import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class footer extends StatelessWidget {
  const footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.bottomCenter,
      padding: EdgeInsetsDirectional.only(
        start: 22.w,
        end: 22.w,
        bottom: 20.h,
        top: 24.h,
      ),
      color: Colors.white,
      height: 180.h,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("images/vector/Facebook_Icon.svg"),
              SizedBox(
                width: 29.w,
              ),
              SvgPicture.asset("images/vector/Twitter.svg"),
              SizedBox(
                width: 29.w,
              ),
              SvgPicture.asset("images/vector/Instagram_Icon.svg"),
            ],
          ),
          SizedBox(
            height: 21.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("images/vector/Visa_Icon.svg"),
              SizedBox(
                width: 12.w,
              ),
              Image.asset("images/Knet_Icon.png"),
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.contact_footer1,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  color: Constants.blackColor,
                  fontFamily: "Work Sans",
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              Text(
                AppLocalizations.of(context)!.contact_footer2,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  color: Constants.blackColor,
                  fontFamily: "Work Sans",
                ),
              ),
              SizedBox(
                width: 13.w,
              ),
              Text(
                AppLocalizations.of(context)!.contact_footer3,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  color: Constants.blackColor,
                  fontFamily: "Work Sans",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.contact_footer4,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: Constants.textGreyColor,
                  fontFamily: "Work Sans",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

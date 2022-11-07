import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/generated/l10n.dart';
import 'package:coffee_shop/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AboutScreen extends StatefulWidget {

  String name;
  AboutScreen({this.name = "about"});
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: Constants.buildAppBar(myContext: context,data: "about"),
      body: ListView(
        shrinkWrap: false,
        children: [
          Image.asset(
            "images/coffee_photo.jpg",
            height: 240.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
              // height: 10.h,
              ),
          Container(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding:
                  EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 31.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.about_header1,
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat",
                          color: Constants.blackColor),
                    ),
                    Text(
                      AppLocalizations.of(context)!.about_header11,
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat",
                          color: Constants.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                Text(
                  AppLocalizations.of(context)!.about_header2,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Montserrat",
                      color: Constants.blackColor),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Divider(
                  color: Constants.primaryColor,
                  thickness: 2.h,
                  endIndent: 283.w,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  AppLocalizations.of(context)!.about_paragraph1,
                  style: TextStyle(
                    fontFamily: "Work sans",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 32.h,),
                Text(
                  AppLocalizations.of(context)!.about_header3,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Montserrat",
                      color: Constants.blackColor),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Divider(
                  color: Constants.primaryColor,
                  thickness: 2.h,
                  endIndent: 283.w,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  AppLocalizations.of(context)!.about_paragraph2,
                  style: TextStyle(
                    fontFamily: "Work sans",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 56.h,),
              ],
            ),
          ),
          footer()
        ],
      ),
    );
  }
}

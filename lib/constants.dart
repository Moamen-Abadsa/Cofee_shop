import 'package:coffee_shop/screens/menu_screens.dart';
import 'package:coffee_shop/widgets/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_geocoder/geocoder.dart';

class Constants {

  static const String google_api_key = "AIzaSyB5oBIO5Ex1CwyhjfpY7jQx7zw1GUJfuHc";

  static const appBarColor = Color.fromRGBO(19, 17, 12, 1);
  static const primaryColor = Color.fromRGBO(250, 192, 90, 1);
  static const blackColor = Color.fromRGBO(19, 17, 12, 1);
  static const textblackColor = Color.fromRGBO(108, 107, 104, 1);
  static const textGreyColor = Color.fromRGBO(112, 112, 112, 1);
  static const greyColor = Color.fromRGBO(206, 205, 205, 1);
  static const backGroundColor = Color.fromRGBO(245, 245, 245, 1);
  static const borderGreyColor = Color.fromRGBO(221, 221, 221, 1);
  static const borderGreyColor2 = Color.fromRGBO(230, 230, 230, 1);
  static const whiteHalfOpacity = Color.fromRGBO(255, 255, 255, 0.5);

  static AppBar buildAppBar({required BuildContext myContext,
    required String data,
    Color color = Constants.appBarColor}) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      backgroundColor: color,
      // backgroundColor: Color(0x13110),
      elevation: 0,
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 9, top: 0),
        child: Image.asset(
          "images/coffee.png",
          height: 65.h,
          width: 62.w,
        ),
      ),
      titleSpacing: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("images/vector/User_Icon.svg"),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("images/vector/Search_Icon.svg"),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                myContext,
                MaterialPageRoute(
                  builder: (context) =>
                      MenuScreen(
                        name: data,
                      ),
                ));
          },
          icon: SvgPicture.asset("images/vector/Menu_Icon.svg"),
        ),
      ],
    );
  }

//------------------------------------------------------------------------

  static Container myCard({required String pathOfImage,
    required String firstText,
    required String secondText,
    double firstFontSize = 20,
    double secondFontSize = 14}) {
    // String image = pathOfImage ;
    // String firstT = firstText ;
    // String secondT = secondText ;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 3),
              blurRadius: 60,
            ),
          ]),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "$pathOfImage",
              fit: BoxFit.fill,
              height: 189.h,
              width: 343.w,
            ),
            SizedBox(
              height: 17.h,
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 19.w, bottom: 23.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$firstText",
                    style: TextStyle(
                        fontSize: firstFontSize,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        color: Constants.blackColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    """$secondText""",
                    style: TextStyle(
                        fontSize: secondFontSize,
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w300,
                        color: Constants.textGreyColor,
                        height: 1.5.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//------------------------------------------------------------------------

  static Container pageViewIndicator({
    double margin = 7.0,
    required bool selected,
    Color selectedColor = Constants.primaryColor,
    Color unselectedColor = Constants.borderGreyColor2,
  }) {
    return Container(
      width: 7.w,
      height: 7.w,
      decoration: BoxDecoration(
        color: selected ? selectedColor : unselectedColor,
        shape: BoxShape.circle,
      ),
      margin: EdgeInsetsDirectional.only(end: margin),
    );
  }

//------------------------------------------------------------------------

  static Container offersPageView({required String pathOfImage,
    required String firstText,
    required String secondText,
    required String offer,
    double firstFontSize = 20,
    double secondFontSize = 14}) {
    // String image = pathOfImage ;
    // String firstT = firstText ;
    // String secondT = secondText ;
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0.w, 3.h),
              blurRadius: 60.r,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                "$pathOfImage",
                fit: BoxFit.fill,
                height: 200.h,
                width: 343.w,
              ),
              PositionedDirectional(
                start: 0,
                top: 150.h,
                child: Container(
                  alignment: Alignment.center,
                  color: Constants.primaryColor,
                  height: 50.h,
                  width: 120.w,
                  child: Text(
                    offer,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          Container(
            padding: EdgeInsetsDirectional.only(start: 19.w, bottom: 23.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$firstText",
                  style: TextStyle(
                      fontSize: firstFontSize,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: Constants.blackColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  """$secondText""",
                  style: TextStyle(
                      fontSize: secondFontSize,
                      fontFamily: "Work Sans",
                      fontWeight: FontWeight.w400,
                      color: Constants.textGreyColor,
                      height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //------------------------------------------------------------------------

  static Container pageViewHomeFirst(
      {String path = "images/stock-photo-70657755.jpg", BuildContext? myContext}) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16.w, end: 30.w),
      child: Row(
        children: [
          Image.asset(
            path,
            fit: BoxFit.fill,
            width: 140.w,
            height: 103.h,
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 168.w,
                child: Text(
                  AppLocalizations.of(myContext!)!.home_page_view,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat",
                      color: Colors.white),
                ),
                height: 53.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              my_elevated_button(
                text: AppLocalizations.of(myContext)!.home_view_button,
                onPressed: () {},
                height: 32.h,
                width: 124.w,
                raduis: 20.r,
                fontSize: 14,
                fontFamily: "Helvetica Neue",
              ),
            ],
          ),
          SizedBox(
            height: 23.h,
          ),
        ],
      ),
    );
  }

  //------------------------------------------------------------------------

  static Row pageViewHomeSecond({String firstPath = "images/img.png",
    String secondPath = "images/img_1.png"}) {
    return Row(
      children: [
        Image.asset(
          firstPath,
          height: 100.h,
          width: 163.w,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 17.w,
        ),
        Image.asset(
          secondPath,
          height: 100.h,
          width: 163.w,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}



//------------------------------------------------------------------------

import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/models/card.dart';
import 'package:coffee_shop/screens/browse_cafe_screen.dart';
import 'package:coffee_shop/widgets/drop_down.dart';
import 'package:coffee_shop/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrowseCafeScreen extends StatefulWidget {
  String name;

  BrowseCafeScreen({this.name = "about"});

  @override
  State<BrowseCafeScreen> createState() => _BrowseCafeScreenState();
}

class _BrowseCafeScreenState extends State<BrowseCafeScreen> {
  List<String> categories = [
    "Coffee1",
    "Coffee2",
    "Coffee3",
    "Coffee4",
    "Coffee5555",
  ];
  String? selectedItemCategories = "Coffee1";

  List<String> recentCategories = [
    "Coffee1",
    "Coffee2",
    "Coffee3",
    "Coffee4",
    "Coffee5666",
  ];
  String? selectedItemRecentCategories = "Coffee1";



  @override
  Widget build(BuildContext context) {
    List<MyCard> _cards = <MyCard>[
      MyCard(
          pathOfImage: "images/grty_cafe.jpg",
          firstText: AppLocalizations.of(context)!.cafe_subheader1,
          SecondText:
          AppLocalizations.of(context)!.cafe_paragraph,
          firstFontSize: 26,
          SecondFontSize: 16),
      MyCard(
          pathOfImage: "images/horsehow.jpg",
          firstText: AppLocalizations.of(context)!.cafe_subheader2,
          SecondText:
          AppLocalizations.of(context)!.cafe_paragraph,
          firstFontSize: 26,
          SecondFontSize: 16),
      MyCard(
          pathOfImage: "images/slogan_or_tag_line.jpg",
          firstText: AppLocalizations.of(context)!.cafe_subheader3,
          SecondText:
          AppLocalizations.of(context)!.cafe_paragraph,
          firstFontSize: 26,
          SecondFontSize: 16)
    ];
    return Scaffold(
      appBar: Constants.buildAppBar(myContext: context, data: "cafe"),
      backgroundColor: Constants.backGroundColor,
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            // height: 190.h,
            width: double.infinity,
            padding:
                EdgeInsetsDirectional.only(start: 20.w, top: 23.h, end: 16.w,bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.cafe_header,
                  style: TextStyle(
                      color: Constants.blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.sp,
                      fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 40.w),
                  child: Text(
                    AppLocalizations.of(context)!.cafe_header_paragraph1,
                    style: TextStyle(
                        fontFamily: "Work sans",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        height: 1.4.sp),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsetsDirectional.only(start: 14.w, end: 11.w),
                        height: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Constants.borderGreyColor2,
                          width: 1.w,
                        )),
                        child: DropdownButton<String>(
                          onTap: () {},
                          isExpanded: true,
                          value: selectedItemCategories,
                          hint: Text(
                            AppLocalizations.of(context)!.cafe_most_rating,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "Work Sans"),
                          ),
                          underline: Container(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Constants.primaryColor,
                          ),
                          items: categories
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontFamily: "Work Sans"),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              selectedItemCategories = item;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsetsDirectional.only(start: 14.w, end: 11.w),
                        height: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Constants.borderGreyColor2,
                            width: 1.w,
                          ),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedItemRecentCategories,
                          hint: Text(
                            AppLocalizations.of(context)!.cafe_most_categories,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "Work Sans"),
                          ),
                          underline: Container(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Constants.primaryColor,
                          ),
                          items: recentCategories
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontFamily: "Work Sans"),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              selectedItemRecentCategories = item;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.builder(
            itemCount: _cards.length,
            itemBuilder: (context, index) {
              return Constants.myCard(
                pathOfImage: _cards[index].pathOfImage,
                firstText: _cards[index].firstText,
                secondText: _cards[index].SecondText,
                firstFontSize: _cards[index].firstFontSize,
                secondFontSize: _cards[index].SecondFontSize,
              );
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
            ),
          ),
          Container(
            height: 50.h,
            width: 172.w,
            margin: EdgeInsetsDirectional.only(
                start: 101.5.w, end: 101.5.w, top: 14.h),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.cafe_load_button,
                style: TextStyle(
                    fontFamily: "Helvetica Neue",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Constants.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.r),
                  ),
                ),
                minimumSize: Size(172, 50.h),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          footer()
        ],
      ),
    );
  }
}

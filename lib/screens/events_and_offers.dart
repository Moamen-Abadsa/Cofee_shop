import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EventsAndOffers extends StatefulWidget {


  String name;
  EventsAndOffers({this.name = "about"});

  @override
  State<EventsAndOffers> createState() => _EventsAndOffersState();
}

class _EventsAndOffersState extends State<EventsAndOffers> {
  late PageController _enventPageController;
  late PageController _offersPageController;

  int _eventCurrentPageIndex = 0;
  int _offersCurrentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _enventPageController = PageController(initialPage: 0);
    _offersPageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _enventPageController.dispose();
    _offersPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: Constants.buildAppBar(myContext: context,data: "events"),
      body: ListView(
        children: [
          Container(
            height: 120.h,
            color: Colors.white,
            padding: EdgeInsetsDirectional.only(start: 20.w, top: 23.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.events_header,
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: Constants.blackColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  AppLocalizations.of(context)!.events_paragraph,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "Work sans",
                      fontWeight: FontWeight.w300,
                      color: Constants.textGreyColor),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 17.h),
            child: ListView(
              padding: EdgeInsetsDirectional.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Text(
                  AppLocalizations.of(context)!.events_events,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: Constants.blackColor),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 330.h,
                  child: PageView(
                    controller: _enventPageController,
                    onPageChanged: (value) {
                      setState(() {
                        _eventCurrentPageIndex = value;
                      });
                    },
                    children: [
                      Constants.myCard(
                        firstText: AppLocalizations.of(context)!.events_subheader1,
                        secondText: AppLocalizations.of(context)!.events_paragraph2,
                        pathOfImage: "images/coffee_photo2.jpg",
                      ),
                      Constants.myCard(
                          firstText: AppLocalizations.of(context)!.events_subheader2,
                          secondText:
                          AppLocalizations.of(context)!.events_paragraph2,
                          pathOfImage: "images/coffee_photo.jpg"),
                      Constants.myCard(
                        firstText: AppLocalizations.of(context)!.events_subheader2,
                        secondText: AppLocalizations.of(context)!.events_paragraph3,
                        pathOfImage: "images/coffee_photo2.jpg",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Constants.pageViewIndicator(
                  selected: _eventCurrentPageIndex == 0 ? true : false),
              Constants.pageViewIndicator(
                  selected: _eventCurrentPageIndex == 1 ? true : false),
              Constants.pageViewIndicator(
                  selected: _eventCurrentPageIndex == 2 ? true : false,
                  margin: 0),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            margin:
                EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 17.h),
            child: ListView(
              padding: EdgeInsetsDirectional.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Text(
                  AppLocalizations.of(context)!.events_offers,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: Constants.blackColor),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 340.h,
                  child: PageView(
                    controller: _offersPageController,
                    onPageChanged: (value) {
                      setState(() {
                        _offersCurrentPageIndex = value;
                      });
                    },
                    children: [
                      Constants.offersPageView(
                          firstText: AppLocalizations.of(context)!.events_subheader1,
                          secondText:
                          AppLocalizations.of(context)!.events_paragraph,
                          pathOfImage: "images/coffee_photo2.jpg",
                          offer: AppLocalizations.of(context)!.events_offers_value),
                      Constants.offersPageView(
                          firstText: "Perfect Coffee Latte",
                          secondText:
                          AppLocalizations.of(context)!.events_paragraph3,
                          pathOfImage: "images/coffee_photo.jpg",
                          offer: "\$14.99"),
                      Constants.offersPageView(
                        firstText: "Perfect Coffee Latte",
                        secondText: AppLocalizations.of(context)!.cafe_subheader3,
                        pathOfImage: "images/coffee_photo2.jpg",
                          offer: "\$14.99"
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 16.h,
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Constants.pageViewIndicator(
                        selected: _offersCurrentPageIndex == 0 ? true : false),
                    Constants.pageViewIndicator(
                        selected: _offersCurrentPageIndex == 1 ? true : false),
                    Constants.pageViewIndicator(
                        selected: _offersCurrentPageIndex == 2 ? true : false,
                        margin: 0),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
          footer()
        ],
      ),
    );
  }
}

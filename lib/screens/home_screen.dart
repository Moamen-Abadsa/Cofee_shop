import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/models/offers.dart';
import 'package:coffee_shop/screens/home_screen.dart';
import 'package:coffee_shop/widgets/footer.dart';
import 'package:coffee_shop/widgets/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  String name;

  HomeScreen({this.name = "about"});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Offer> _offers = [Offer(), Offer()];

  int countOfOffers = 2;

  late PageController _headerPageController;
  late PageController _secondPageController;

  int _headerCurrentPageIndex = 0;
  int _secondCurrentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _headerPageController = PageController(initialPage: 0);
    _secondPageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _headerPageController.dispose();
    _secondPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: 240.h,
              minWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerEnd,
                end: AlignmentDirectional.centerStart,
                colors: [
                  Color.fromRGBO(95, 90, 80, 1),
                  Color.fromRGBO(195, 188, 153, 1),
                ],
              ),
              image: DecorationImage(
                opacity: 0.05,
                image: AssetImage("images/coffee_photo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Constants.buildAppBar(
                        myContext: context,
                        data: "home",
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        height: 105.h,
                        child: PageView(
                          controller: _headerPageController,
                          onPageChanged: (value) {
                            setState(() {
                              _headerCurrentPageIndex = value;
                            });
                          },
                          children: [
                            Constants.pageViewHomeFirst(
                              path: "images/stock-photo-70657755.jpg",
                              myContext: context,
                            ),
                            Constants.pageViewHomeFirst(
                              path: "images/img_1.png",
                              myContext: context,
                            ),
                            Constants.pageViewHomeFirst(
                              path: "images/coffee_photo.jpg",
                              myContext: context,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Constants.pageViewIndicator(
                              selected:
                                  _headerCurrentPageIndex == 0 ? true : false,
                              selectedColor: Colors.white,
                              unselectedColor: Constants.whiteHalfOpacity),
                          Constants.pageViewIndicator(
                              selected:
                                  _headerCurrentPageIndex == 1 ? true : false,
                              selectedColor: Colors.white,
                              unselectedColor: Constants.whiteHalfOpacity),
                          Constants.pageViewIndicator(
                              selected:
                                  _headerCurrentPageIndex == 2 ? true : false,
                              margin: 0,
                              selectedColor: Colors.white,
                              unselectedColor: Constants.whiteHalfOpacity),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.home_most_rating,
                  style: TextStyle(
                      color: Constants.blackColor,
                      fontFamily: "Montserrat",
                      fontSize: 22),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 100.h,
                  child: PageView(
                    controller: _secondPageController,
                    onPageChanged: (value) {
                      setState(() {
                        _secondCurrentPageIndex = value;
                      });
                    },
                    children: [
                      Constants.pageViewHomeSecond(
                          firstPath: "images/img.png",
                          secondPath: "images/img_1.png"),
                      Constants.pageViewHomeSecond(
                          firstPath: "images/coffee_photo2.jpg",
                          secondPath: "images/coffee_photo.jpg"),
                      Constants.pageViewHomeSecond(
                          firstPath: "images/img.png",
                          secondPath: "images/img_1.png"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Constants.pageViewIndicator(
                      selected: _secondCurrentPageIndex == 0 ? true : false,
                    ),
                    Constants.pageViewIndicator(
                      selected: _secondCurrentPageIndex == 1 ? true : false,
                    ),
                    Constants.pageViewIndicator(
                      selected: _secondCurrentPageIndex == 2 ? true : false,
                      margin: 0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  AppLocalizations.of(context)!.home_event_and_offers,
                  style: TextStyle(
                      color: Constants.blackColor,
                      fontFamily: "Montserrat",
                      fontSize: 22),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _offers.length,
                  itemBuilder: (context, index) {
                    return Constants.offersPageView(
                        pathOfImage: _offers[index].pathOfImage,
                        firstText: AppLocalizations.of(context)!.home_subheader,
                        secondText:
                            AppLocalizations.of(context)!.home_paragraph,
                        offer: AppLocalizations.of(context)!.home_offers_value);
                  },
                ),
                SizedBox(height: 14.h),
                Center(
                  child: my_elevated_button(
                    text: AppLocalizations.of(context)!.home_view_more,
                    onPressed: () {},
                    height: 34.h,
                    width: 147.w,
                    raduis: 25.r,
                    fontFamily: "Helvetica Neue",
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                )
              ],
            ),
          ),
          footer()
        ],
      ),
    );
  }
}

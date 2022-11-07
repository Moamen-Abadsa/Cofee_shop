import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/my_provider.dart';
import 'package:coffee_shop/screens/about_screen.dart';
import 'package:coffee_shop/screens/browse_cafe_screen.dart';
import 'package:coffee_shop/screens/contact_us_screen.dart';
import 'package:coffee_shop/screens/events_and_offers.dart';
import 'package:coffee_shop/screens/home_screen.dart';
import 'package:coffee_shop/screens/menu_screens.dart';
import 'package:coffee_shop/widgets/menu_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  String name;

  MenuScreen({required this.name});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late TapGestureRecognizer _enRecognizer;
  late TapGestureRecognizer _arRecognizer;

  @override
  void initState() {
    super.initState();
    _enRecognizer = TapGestureRecognizer()
      ..onTap = changeLanguageToArabic;
    _arRecognizer = TapGestureRecognizer()
      ..onTap = changeLanguageToEnglish;
  }

  @override
  void dispose() {
    _enRecognizer.dispose();
    _arRecognizer.dispose();
    super.dispose();
  }

  void changeLanguageToArabic() {
    var x = Provider.of<MyProvider>(context,listen: false).languageCode;
    Provider.of<MyProvider>(context, listen: false)
        .changeLanguage(languageCode: 'en');
    setState(() {

    });
  }

  void changeLanguageToEnglish() {
    var x = Provider.of<MyProvider>(context,listen: false).languageCode;
    Provider.of<MyProvider>(context, listen: false)
        .changeLanguage(languageCode: 'ar');
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var myLanguage = Provider.of<MyProvider>(context,listen: false).languageCode;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage("images/coffee_photo.jpg"),
              fit: BoxFit.cover,
              opacity: 0.07),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Container(
                    height: 65.h,
                    width: 62.w,
                    margin: EdgeInsetsDirectional.only(start: 30.w),
                    child: Image.asset("images/coffee.png")),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            myMenuItem(
              text: AppLocalizations.of(context)!.menu_home,
              isVisibl: widget.name == "home" ? true : false,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        name: "home",
                      ),
                    ));
              },
            ),
            myMenuItem(
              text: AppLocalizations.of(context)!.menu_cafe,
              isVisibl: widget.name == "cafe" ? true : false,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BrowseCafeScreen(
                        name: "cafe",
                      ),
                    ));
              },
            ),
            myMenuItem(
              text: AppLocalizations.of(context)!.menu_event,
              isVisibl: widget.name == "events" ? true : false,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventsAndOffers(
                        name: "event",
                      ),
                    ));
              },
            ),
            myMenuItem(
              text: AppLocalizations.of(context)!.menu_about,
              isVisibl: widget.name == "about" ? true : false,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(
                        name: "about",
                      ),
                    ));
              },
            ),
            myMenuItem(
              text: AppLocalizations.of(context)!.menu_contact,
              isVisibl: widget.name == "contact" ? true : false,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUS(
                        name: AppLocalizations.of(context)!.menu_add,
                      ),
                    ));
              },
            ),
            SizedBox(
              height: 171.h,
            ),
            Center(
              child: Container(
                height: 40.h,
                width: 117.w,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Color.fromRGBO(255, 255, 255, 0.15)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "",
                        children: [
                          TextSpan(
                            text: "EN ",
                            style: TextStyle(
                                fontFamily: "Work sans",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: myLanguage == 'en' ? Constants.primaryColor : Colors.white),
                            recognizer: _enRecognizer,
                          ),
                          TextSpan(text: "/"),
                          TextSpan(
                            text: " AR",
                            style: TextStyle(
                                fontFamily: "Work sans",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: myLanguage == 'ar' ? Constants.primaryColor : Colors.white),
                                recognizer: _arRecognizer,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 48.h,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              // height: 48.h,
              // width: 209.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/add_cafe_screen");
                },
                child: Text(
                  AppLocalizations.of(context)!.menu_add,
                  style: TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
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
                  minimumSize: Size(209.w, 48.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

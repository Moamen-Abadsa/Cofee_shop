import 'package:coffee_shop/screens/sign_in_screen.dart';
import 'package:coffee_shop/widgets/footer.dart';
import 'package:coffee_shop/widgets/my_elevated_button.dart';
import 'package:coffee_shop/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {

  String name;
  SignInScreen({this.name = "about"});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    super.initState();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailEditingController.dispose();
    _passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: Constants.buildAppBar(myContext: context,data: "sign_in"),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
            padding: EdgeInsetsDirectional.all(15),
            margin: EdgeInsetsDirectional.only(
                start: 16.w, end: 16.w, top: 15.h, bottom: 15),
            // width: 343.w,
            // height: 299.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.signin_header,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Work Sans",
                      color: Constants.primaryColor),
                ),
                SizedBox(
                  height: 20.h,
                ),
                myTextField(
                  text: AppLocalizations.of(context)!.signin_email,
                  hint: AppLocalizations.of(context)!.signin_email_hint,
                  type: TextInputType.emailAddress,
                  controller: _emailEditingController,
                ),
                SizedBox(
                  height: 20,
                ),
                myTextField(
                  text: AppLocalizations.of(context)!.signin_Password,
                  hint: AppLocalizations.of(context)!.signin_Password_hint,
                  type: TextInputType.text,
                  controller: _passwordEditingController,
                ),
                SizedBox(
                  height: 20,
                ),
                my_elevated_button(text: AppLocalizations.of(context)!.signin_button,onPressed: () {

                },)
              ],
            ),
          ),
          Spacer(),
          footer(),
        ],
      ),
    );
  }
}

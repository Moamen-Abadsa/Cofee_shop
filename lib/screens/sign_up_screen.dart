import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/screens/sign_up_screen.dart';
import 'package:coffee_shop/widgets/footer.dart';
import 'package:coffee_shop/widgets/my_elevated_button.dart';
import 'package:coffee_shop/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SignUpScreen extends StatefulWidget {

  String name;
  SignUpScreen({this.name = "about"});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  late TextEditingController _firstNameEditingController;
  late TextEditingController _lastNameEditingController;
  late TextEditingController _emailNameEditingController;
  late TextEditingController _passwordNameEditingController;
  late TextEditingController _repeatNameEditingController;

  @override
  void initState() {
    super.initState();
    _firstNameEditingController = TextEditingController();
    _lastNameEditingController = TextEditingController();
    _emailNameEditingController = TextEditingController();
    _passwordNameEditingController = TextEditingController();
    _repeatNameEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameEditingController.dispose();
        _lastNameEditingController.dispose();
    _emailNameEditingController.dispose();
        _passwordNameEditingController.dispose();
    _repeatNameEditingController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: Constants.buildAppBar(myContext: context,data: "sign_up"),
      body: ListView(
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
                  AppLocalizations.of(context)!.signup_header,
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
                  text: AppLocalizations.of(context)!.signup_first_name,
                  hint: AppLocalizations.of(context)!.signup_first_name_hint,
                  type: TextInputType.text,
                  controller: _firstNameEditingController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                myTextField(
                  text: AppLocalizations.of(context)!.signup_last_name,
                  hint: AppLocalizations.of(context)!.signup_last_name_hint,
                  type: TextInputType.text,
                  controller: _lastNameEditingController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                myTextField(
                  text: AppLocalizations.of(context)!.signup_email,
                  hint: AppLocalizations.of(context)!.signup_email_hint,
                  type: TextInputType.emailAddress,
                  controller: _emailNameEditingController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                myTextField(
                  text: AppLocalizations.of(context)!.signup_password,
                  hint: AppLocalizations.of(context)!.signup_password_hint,
                  type: TextInputType.text,
                  controller: _passwordNameEditingController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                myTextField(
                  text: AppLocalizations.of(context)!.signup_password_repeat,
                  hint: AppLocalizations.of(context)!.signup_password_hint,
                  type: TextInputType.text,
                  controller: _repeatNameEditingController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                my_elevated_button(text: AppLocalizations.of(context)!.signup_button,onPressed: () {
                  Navigator.pushReplacementNamed(context, "/sign_in_screen");
                },)
              ],
            ),
          ),
          Spacer(),
          footer()
        ],
      ),
    );
  }
}

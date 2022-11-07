import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/screens/contact_us_screen.dart';
import 'package:coffee_shop/widgets/contacts_information.dart';
import 'package:coffee_shop/widgets/footer.dart';
import 'package:coffee_shop/widgets/my_elevated_button.dart';
import 'package:coffee_shop/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:email_validator/email_validator.dart';

class ContactUS extends StatefulWidget {
  String name;

  ContactUS({this.name = "about"});

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  late TextEditingController _phoneEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _messageNameEditingController;

  bool emailError = false;
  bool phoneError = false;
  String? emailErrorMessage = null;
  String? phoneErrorMessage = null;

  @override
  void initState() {
    super.initState();
    _phoneEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _messageNameEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneEditingController.dispose();
    _emailEditingController.dispose();
    _messageNameEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.backGroundColor,
        appBar: Constants.buildAppBar(myContext: context, data: "contact"),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(start: 20.w, top: 22.h),
              color: Colors.white,
              height: 120.h,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.contact_contact_us,
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 30.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.contact_paragraph,
                    style: TextStyle(
                      color: Constants.textGreyColor,
                      fontFamily: "Work Sans",
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.r))),
              padding: EdgeInsetsDirectional.all(15),
              margin: EdgeInsetsDirectional.only(
                  start: 16.w, end: 16.w, top: 15.h, bottom: 15.h),
              // width: 343.w,
              // height: 299.h,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.contact_header1,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Work Sans",
                        color: Constants.primaryColor),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ContactsInformation(
                    firstHeader:
                        AppLocalizations.of(context)!.contact_office_address,
                    firstText: AppLocalizations.of(context)!.contact_address1,
                    secondText: AppLocalizations.of(context)!.contact_address2,
                    pathOfSvg: "images/vector/location.svg",
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ContactsInformation(
                    firstHeader:
                        AppLocalizations.of(context)!.contact_email_address,
                    firstText: AppLocalizations.of(context)!.contact_email1,
                    secondText: AppLocalizations.of(context)!.contact_email2,
                    pathOfSvg: "images/vector/email.svg",
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ContactsInformation(
                    firstHeader: AppLocalizations.of(context)!.contact_phone,
                    firstText:
                        AppLocalizations.of(context)!.contact_phone_number1,
                    secondText:
                        AppLocalizations.of(context)!.contact_phone_number2,
                    pathOfSvg: "images/vector/call.svg",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    color: Color.fromRGBO(244, 242, 242, 1),
                    thickness: 1.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  myTextField(
                    text: AppLocalizations.of(context)!.contact_email,
                    hint: AppLocalizations.of(context)!.contact_email_hint,
                    type: TextInputType.emailAddress,
                    controller: _emailEditingController,
                    error: emailError,
                    errorText: emailError ? emailErrorMessage : null,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  myTextField(
                    text: AppLocalizations.of(context)!.contact_phone,
                    hint: AppLocalizations.of(context)!.contact_phone_hint,
                    type: TextInputType.phone,
                    controller: _phoneEditingController,
                    error: phoneError,
                    errorText: phoneError ? phoneErrorMessage : null,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    child: myTextField(
                      text: AppLocalizations.of(context)!.contact_message,
                      hint: AppLocalizations.of(context)!.contact_message_hint,
                      type: TextInputType.multiline,
                      multyLine: true,
                      controller: _messageNameEditingController,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  my_elevated_button(
                    text: AppLocalizations.of(context)!.contact_submit,
                    onPressed: () {
                      validateEmail(_emailEditingController.text);
                      print("Email issssssssssssssssssssss ${_emailEditingController.text}");
                      validatePhone(_phoneEditingController.text);
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
            // Spacer(),
            footer()
          ],
        ));
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        emailErrorMessage = "Email can not be empty";
        emailError = true;
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        emailErrorMessage = "Invalid Email Address";
        emailError = true;
      });
    } else {
      setState(() {
        emailErrorMessage = null;
        emailError = false;
      });
    }
  }

  void validatePhone(String val) {
    if (val.isEmpty) {
      setState(() {
        phoneErrorMessage = "Phone can not be empty";
        phoneError = true;
      });
    } else if (_phoneEditingController.text.length != 10) {
      setState(() {
        phoneErrorMessage = "Invalid phone number";
        phoneError = true;
      });
    } else {
      setState(() {
        phoneErrorMessage = null;
        phoneError = false;
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_shop/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnToggle = void Function(int? myIndex);

class MyToggleSwich extends StatelessWidget {
  final String text;
  final int initialLabelIndex;
  static bool yesOrNo = false;
  final OnToggle? onToggle;


  MyToggleSwich({
    required this.text,
    required this.initialLabelIndex,
    required this.onToggle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r),
            topRight: Radius.circular(6.r),
            bottomLeft: Radius.circular(6.r),
            bottomRight: Radius.circular(6.r),
          ),
          border: Border.all(color: Constants.borderGreyColor)),
      child: Row(
        children: [
          Text(
            "$text",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: "Work Sans",
                color: Constants.textGreyColor),
          ),
          Spacer(),
          ToggleSwitch(
            minWidth: 50.w,
            minHeight: 36.h,
            borderWidth: 1,
            activeFgColor: Colors.white,
            activeBgColor: [Constants.primaryColor],
            radiusStyle: false,
            initialLabelIndex: initialLabelIndex,
            totalSwitches: 2,
            labels: [
              AppLocalizations.of(context)!.add_cafe_yes,
              AppLocalizations.of(context)!.add_cafe_no,
            ],
            fontSize: 15,
            cornerRadius: 22.r,
            inactiveBgColor: Colors.white,
            inactiveFgColor: Color.fromRGBO(144, 144, 143, 1),
            activeBorders: [
              Border.all(color: Constants.primaryColor),
            ],
            borderColor: [
              Constants.borderGreyColor
            ],
            onToggle: (index) {
              print("Value is $index");
            },
          ),
        ],
      ),
    );
  }

}

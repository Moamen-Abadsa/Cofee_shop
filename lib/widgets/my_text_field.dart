import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class myTextField extends StatelessWidget {
  final String text;
  final String hint;
  final TextInputType type;
  final bool multyLine;
  final TextEditingController controller;
  Widget? icon;
  int lines;
  bool error;
  String? errorText;
  void Function()? onTap = null;
  void Function()? onChanged = null;
  bool enabled;

  myTextField(
      {required this.text,
      required this.hint,
      required this.type,
      this.multyLine = false,
      required this.controller,
      this.icon = null,
      this.lines = 6,
      this.error = false,
      this.errorText = "Please enter a value",
      this.onTap,
      this.enabled = true,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Constants.textblackColor,
            fontFamily: "Work Sans",
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          maxLines: multyLine ? lines : 1,
          keyboardType: type,
          decoration: InputDecoration(
            enabled: enabled,
            suffixIcon: icon,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6.r),
              ),
              borderSide: BorderSide(
                color: Constants.greyColor,
                width: 1.w,
              ),
            ),
            errorBorder: error
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.r),
                    ),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.w,
                    ),
                  )
                : null,
            errorText: error ? errorText : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6.r),
              ),
              borderSide: BorderSide(
                color: Constants.greyColor,
                width: 1.w,
              ),
            ),
            hintText: hint,
            hintStyle:
                TextStyle(color: Constants.borderGreyColor, fontSize: 16),
            contentPadding: EdgeInsetsDirectional.only(
              start: 16.w,
              top: multyLine ? 26.h : 13.h,
            ),
          ),
          onTap: onTap,
          onChanged: (value) => onChanged,
        )
      ],
    );
  }
}

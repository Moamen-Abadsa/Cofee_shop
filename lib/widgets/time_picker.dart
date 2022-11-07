import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_shop/constants.dart';
import 'package:intl/intl.dart';

class time_picker extends StatelessWidget {
  TimeOfDay? myTime;
  final String text;
  final String hint;
  final TextEditingController controller;
  TimeOfDay time = TimeOfDay(hour: 10, minute: 40);
  // void Function() getTime ;


  time_picker({
    required this.text,
    required this.hint,
    required this.controller,
    // required this.time
  });

  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();
    var formatterDate = DateFormat('dd/MM/yy');
    var formatterTime = DateFormat('kk:mm:ss');
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);
    controller.text = "${actualTime}";


    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        color: Color.fromRGBO(252, 252, 252, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
        border: Border.all(
          color: Constants.borderGreyColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsetsDirectional.only(start: 7.w),
            width: 90.w,
            child: TextButton.icon(
              onPressed: () async {
                TimeOfDay? newTime =
                    await showTimePicker(context: context, initialTime: time);
                myTime = newTime;
                var hours = newTime?.hour.toString().padLeft(2, '0');
                var minute = newTime?.minute.toString().padLeft(2, '0');
                if (newTime == null) {
                  controller.text = "${actualTime}";
                  return;
                } else {
                  time = newTime;
                  controller.text = "${time.hour} : ${time.minute} : 00";
                }
              },
              icon: SvgPicture.asset(
                "images/vector/Time_Icon.svg",
              ),
              label: Text(
                "$text",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Work Sans",
                  color: Constants.textGreyColor,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 10.w),
            height: double.infinity,
            width: 1,
            color: Constants.greyColor,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "$hint",
                hintStyle: TextStyle(
                  color: Constants.greyColor,
                  fontFamily: "Work Sans",
                  fontSize: 16,
                ),
                contentPadding:
                    EdgeInsetsDirectional.only(start: 13.w, top: 5.h),
              ),
            ),
          )
        ],
      ),
    );
  }
}

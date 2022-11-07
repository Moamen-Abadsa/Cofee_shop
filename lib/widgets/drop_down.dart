import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class dropDown extends StatefulWidget {

  final String hint;
  final List<String> categories;

  dropDown({required this.hint, required this.categories});
  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

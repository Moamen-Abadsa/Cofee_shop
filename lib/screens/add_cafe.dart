import 'dart:io';

import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/models/offers.dart';
import 'package:coffee_shop/screens/google_map.dart';
import 'package:coffee_shop/screens/home_screen.dart';
import 'package:coffee_shop/widgets/drop_down.dart';
import 'package:coffee_shop/widgets/footer.dart';
import 'package:coffee_shop/widgets/my_elevated_button.dart';
import 'package:coffee_shop/widgets/my_text_field.dart';
import 'package:coffee_shop/widgets/time_picker.dart';
import 'package:coffee_shop/widgets/toggle_swich.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_geocoder/geocoder.dart';

class AddCafe extends StatefulWidget {
  const AddCafe({Key? key}) : super(key: key);

  @override
  State<AddCafe> createState() => _AddCafeState();
}

class _AddCafeState extends State<AddCafe> {
  var Address;

  bool nameError = false;
  String? nameErrorMessage = null;
  bool locationError = false;
  String? locationErrorMessage = null;
  bool imageError = false;
  String? imageErrorMessage = null;
  bool timeError = false;
  String? timeErrorMessage = null;

  //---------------------------------------------------------------------

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
  }

  //--------------------------------------------------pick image---------

  final ImagePicker _picker = ImagePicker();
  File? image;

  Future pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      setState(() => this.image = imageTemporary);
      // print("The path of image is ...............${image?.path ?? "please < pick an image"}");
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
    validateImage(image);
  }

  Future pickImageFromCamera() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      setState(() => this.image = imageTemporary);
      // print("The path of image is ...............${image?.path ?? "please < pick an image"}");
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
    validateImage(image);
  }

  //---------------------------------------------------

  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

//-----------------------------------------------------

  List<String> categories = [
    "café",
    "Coffee2",
    "Coffee3",
    "Coffee4",
    "Coffee5555",
  ];
  String? selectedItemCategories = "café";

  //---------------------------------------------------

  late TextEditingController _nameEditingController;
  late TextEditingController _firstTimeEditingController;
  late TextEditingController _secondTimeEditingController;
  late TextEditingController _locationTimeEditingController;
  late TextEditingController _additionalEditingController;
  late TextEditingController _discountEditingController;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController();
    _firstTimeEditingController = TextEditingController();
    _secondTimeEditingController = TextEditingController();
    _locationTimeEditingController = TextEditingController();
    _additionalEditingController = TextEditingController();
    _discountEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _firstTimeEditingController.dispose();
    _secondTimeEditingController.dispose();
    _locationTimeEditingController.dispose();
    _additionalEditingController.dispose();
    _discountEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: Constants.borderGreyColor, width: 1);

    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: Constants.buildAppBar(myContext: context, data: "add_cafe"),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(start: 20.w, top: 23.h),
            height: 120.h,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.add_cafe_header,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: Constants.blackColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  AppLocalizations.of(context)!.add_cafe_header_paragraph,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.w300,
                    color: Constants.blackColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.all(16),
            padding: EdgeInsetsDirectional.only(
              start: 15.w,
              end: 15.w,
              top: 18.h,
              bottom: 15.h,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Text(
                  AppLocalizations.of(context)!.add_cafe_subheader,
                  style: TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Work Sans"),
                ),
                SizedBox(
                  height: 16.h,
                ),
                myTextField(
                  text: AppLocalizations.of(context)!.add_cafe_name,
                  hint: AppLocalizations.of(context)!.add_cafe_name_hint,
                  type: TextInputType.text,
                  controller: _nameEditingController,
                  errorText: nameErrorMessage,
                  error: nameError,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppLocalizations.of(context)!.add_cafe_category,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: "Work Sans",
                      color: Constants.textGreyColor),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 14.w, end: 11.w),
                  height: 44.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Constants.borderGreyColor2,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: DropdownButton<String>(
                    onTap: () {},
                    isExpanded: true,
                    value: selectedItemCategories,
                    hint: Text(
                      AppLocalizations.of(context)!.add_cafe_category_hint,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: "Work Sans",
                          color: Color.fromRGBO(183, 183, 183, 1)),
                    ),
                    underline: Container(),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Constants.greyColor,
                    ),
                    items: categories
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  fontFamily: "Work Sans",
                                  color: Constants.greyColor),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        selectedItemCategories = item;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppLocalizations.of(context)!.add_cafe_worktime,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: "Work Sans",
                      color: Constants.textGreyColor),
                ),
                SizedBox(
                  height: 8.h,
                ),
                time_picker(
                  text: AppLocalizations.of(context)!.add_cafe_from,
                  hint: AppLocalizations.of(context)!.add_cafe_from_hint,
                  controller: _firstTimeEditingController,
                  // time: time,
                ),
                SizedBox(
                  height: 16.h,
                ),
                time_picker(
                  text: AppLocalizations.of(context)!.add_cafe_to,
                  hint: AppLocalizations.of(context)!.add_cafe_to_hint,
                  controller: _secondTimeEditingController,

                  // time: time,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Visibility(
                    visible: timeError,
                    child: Text(
                      timeErrorMessage ?? "",
                      style: TextStyle(color: Colors.red),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                // Text(
                //   "Location",
                //   style: TextStyle(
                //       fontWeight: FontWeight.w400,
                //       fontSize: 16,
                //       fontFamily: "Work Sans",
                //       color: Constants.textGreyColor),
                // )
                myTextField(
                  text: AppLocalizations.of(context)!.add_cafe_location,
                  hint: Address ??
                      AppLocalizations.of(context)!.add_cafe_location_hint,
                  type: TextInputType.streetAddress,
                  controller: _locationTimeEditingController,
                  icon: SvgPicture.asset(
                    "images/vector/location_grey.svg",
                    height: 18.h,
                    width: 14.59.w,
                    fit: BoxFit.scaleDown,
                  ),
                  multyLine: false,
                  onTap: () async {
                    var p = await _getGeoLocationPosition();

                    var value = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MAP(latlon: LatLng(p.latitude, p.longitude)),
                        )) as LatLng;

                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        value.latitude, value.longitude);
                    setState(() {
                      Address = placemarks[0].street;
                      _locationTimeEditingController.text = Address;

                      validateLocation(_locationTimeEditingController.text);
                    });
                  },
                  error: locationError,
                  errorText: locationErrorMessage,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppLocalizations.of(context)!.add_cafe_cafe_logo,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: "Work Sans",
                      color: Constants.textGreyColor),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  // height: 280.h,
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 57.w,
                      end: 56.w,
                      top: 49.h,
                      bottom: 49.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: imageError ? Colors.red : Constants.greyColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.r),
                      ),
                    ),
                    child: image == null
                        ? Column(
                            children: [
                              SvgPicture.asset("images/vector/Upload_Icon.svg"),
                              SizedBox(
                                height: 29.h,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (Platform.isAndroid) {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.photo),
                                            title: Text("Gallery"),
                                            onTap: pickImageFromGallery,
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text("Camera"),
                                            onTap: pickImageFromCamera,
                                          )
                                        ],
                                      ),
                                    );
                                  } else if (Platform.isIOS) {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.photo),
                                            title: Text("Gallery"),
                                            onTap: pickImageFromGallery,
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text("Camera"),
                                            onTap: pickImageFromCamera,
                                          )
                                        ],
                                      ),
                                    );
                                  }

                                  // await pickImage();
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.add_cafe_choose,
                                  style: TextStyle(
                                      fontFamily: "Work Sans",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Constants.primaryColor),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.white,
                                  minimumSize: Size(200.w, 44.h),
                                  onPrimary: Constants.greyColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(22.r),
                                    ),
                                  ),
                                  side: BorderSide(
                                    color: Constants.primaryColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Image.file(image!),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Visibility(
                    visible: imageError,
                    child: Text(
                      imageErrorMessage ?? '',
                      style: TextStyle(color: Colors.red),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                myTextField(
                  text: AppLocalizations.of(context)!.add_cafe_add_info,
                  hint: AppLocalizations.of(context)!.add_cafe_add_info_hint,
                  type: TextInputType.multiline,
                  controller: _additionalEditingController,
                  multyLine: true,
                  lines: 5,
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
                Text(
                  AppLocalizations.of(context)!.add_cafe_features,
                  style: TextStyle(
                      fontFamily: "Work Sans",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Constants.primaryColor),
                ),
                SizedBox(
                  height: 8.h,
                ),
                MyToggleSwich(
                  text: AppLocalizations.of(context)!.add_cafe_smoking,
                  initialLabelIndex: 0,
                  onToggle: (myIndex) {
                    print("Value is : $myIndex");
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                MyToggleSwich(
                  text: AppLocalizations.of(context)!.add_cafe_study_places,
                  initialLabelIndex: 0,
                  onToggle: (index) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                MyToggleSwich(
                  text: AppLocalizations.of(context)!.add_cafe_meeting,
                  initialLabelIndex: 1,
                  onToggle: (index) {},
                ),
                SizedBox(
                  height: 10.h,
                ),

                // MyToggleSwich(
                //   text: "Discount code",
                //   initialLabelIndex: 0,
                //   radius: 0,
                // ),
                Container(
                  height: 113.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.borderGreyColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.only(
                          start: 16.w,
                          end: 16.w,
                          top: 12.h,
                          bottom: 8.h,
                        ),
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .add_cafe_discount_code,
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
                              initialLabelIndex: 0,
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
                              borderColor: [Constants.borderGreyColor],
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.h,
                        color: Constants.borderGreyColor,
                        height: 7,
                      ),
                      TextField(
                        controller: _discountEditingController,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: AppLocalizations.of(context)!
                              .add_cafe_discount_percentage,
                          hintStyle: TextStyle(
                            color: Constants.greyColor,
                            fontFamily: "Work Sans",
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsetsDirectional.only(
                              start: 16.w, top: 10.h),
                          suffixIcon: SvgPicture.asset(
                            "images/vector/%.svg",
                            fit: BoxFit.scaleDown,
                            color: Color.fromRGBO(144, 144, 143, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                my_elevated_button(
                  text: AppLocalizations.of(context)!.add_cafe_submit,
                  onPressed: () async {
                    setState(() {
                      validateCafeName(_nameEditingController.text);
                      validateLocation(_locationTimeEditingController.text);
                      validateImage(image);
                      validateTime();
                    });
                  },
                )
              ],
            ),
          ),
          footer(),
        ],
      ),
    );
  }

  void validateCafeName(String val) {
    if (val.isEmpty) {
      setState(() {
        nameErrorMessage = "Cafe name can not be empty";
        nameError = true;
      });
    } else {
      setState(() {
        nameErrorMessage = null;
        nameError = false;
      });
    }
  }

  void validateLocation(String val) {
    if (val.isEmpty) {
      setState(() {
        locationErrorMessage = "Location name can not be empty";
        locationError = true;
      });
    } else {
      setState(() {
        locationErrorMessage = null;
        locationError = false;
      });
    }
  }

  void validateImage(File? val) {
    if (val == null) {
      setState(() {
        imageErrorMessage = "      Please pick an image";
        imageError = true;
      });
    } else {
      setState(() {
        imageErrorMessage = null;
        imageError = false;
      });
    }
  }

  void validateTime() {
    var t1 = _firstTimeEditingController.text;
    var t2 = _secondTimeEditingController.text;

    TimeOfDay time1 = TimeOfDay(
        hour: int.parse(t1.split(":")[0]), minute: int.parse(t1.split(":")[1]));
    TimeOfDay time2 = TimeOfDay(
        hour: int.parse(t2.split(":")[0]), minute: int.parse(t2.split(":")[1]));
    var d1 = toDouble(time1);
    var d2 = toDouble(time2);

    if (d1 > d2) {
      timeError = true;
      timeErrorMessage = 'Please Enter a valid time';
    } else {
      timeError = false;
      timeErrorMessage = null;
    }
  }
}

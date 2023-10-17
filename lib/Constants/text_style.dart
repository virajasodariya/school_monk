import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_monk/Constants/color.dart';

class FontTextStyle {
  static const TextStyle appbarTitle = TextStyle(
    color: PickColor.kBlack,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle kGrey13W400 = TextStyle(
    color: PickColor.kGrey,
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
  );

  static const TextStyle kPrimary18Bold = TextStyle(
    color: PickColor.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kPrimaryColor = TextStyle(
    color: PickColor.primaryColor,
  );

  static const TextStyle k13W400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );
}

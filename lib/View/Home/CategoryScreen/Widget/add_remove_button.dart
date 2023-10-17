import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_monk/constants/color.dart';

GestureDetector buildGestureDetector({
  required GestureTapCallback onTap,
  required IconData icon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 25.sp,
      width: 25.sp,
      color: PickColor.primaryColor,
      child: Icon(icon),
    ),
  );
}

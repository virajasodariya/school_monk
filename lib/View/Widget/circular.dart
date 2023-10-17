import 'package:flutter/material.dart';
import 'package:school_monk/Constants/color.dart';

Widget commonCircular() {
  return const Center(
    child: CircularProgressIndicator(
      color: PickColor.primaryColor,
    ),
  );
}

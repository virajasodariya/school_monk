import 'package:flutter/material.dart';

Widget commonText({required String text, TextStyle? textStyle, int? maxLines}) {
  return Text(
    text,
    style: textStyle,
    maxLines: maxLines,
  );
}

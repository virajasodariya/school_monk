import 'package:flutter/material.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/text_style.dart';

AppBar authAppBar(String title) {
  return AppBar(
    backgroundColor: PickColor.kWhite,
    iconTheme: const IconThemeData(color: PickColor.kBlack),
    title: Text(
      title,
      style: FontTextStyle.appbarTitle,
    ),
  );
}

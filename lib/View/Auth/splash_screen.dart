import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/View/Auth/sign_in_screen.dart';
import 'package:school_monk/View/Home/bottom_bar_screen.dart';
import 'package:school_monk/View/Widget/common_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAll(
          () => StaticData.userId.isEmpty
              ? const SignInScreen()
              : const BottomBarScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PickColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgPath.splashScreen),
            commonText(text: "Stationery Shop"),
          ],
        ),
      ),
    );
  }
}

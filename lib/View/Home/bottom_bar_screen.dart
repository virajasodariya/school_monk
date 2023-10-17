import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/Controller/bottom_bar_index.dart';
import 'package:school_monk/View/Home/CategoryScreen/category_screen.dart';
import 'package:school_monk/View/Home/HomeScreen/home_screen.dart';
import 'package:school_monk/View/Home/ProfileScreen/profile_screen.dart';
import 'package:school_monk/View/Home/SchoolScreen/all_school.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  BottomNavigationBarController bottomNavigationBarController =
      Get.put(BottomNavigationBarController());

  List screens = const [
    HomeScreen(),
    CategoryScreen(),
    SchoolScreen(),
    ProfileScreen(),
  ];

  BottomNavigationBarItem createBottomNavigationBarItem(
      int index, String iconPath, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        color: bottomNavigationBarController.currentIndex == index
            ? PickColor.primaryColor
            : PickColor.kGrey,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      builder: (bottomBarController) {
        return Scaffold(
          body: screens[bottomBarController.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border.all(color: PickColor.k707070, width: 1.0),
            ),
            child: BottomNavigationBar(
              currentIndex: bottomBarController.currentIndex,
              onTap: (value) {
                bottomBarController.updateSelectedIndex(value);
              },
              selectedItemColor: PickColor.primaryColor,
              unselectedItemColor: PickColor.kGrey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                createBottomNavigationBarItem(0, SvgPath.home, "Home"),
                createBottomNavigationBarItem(1, SvgPath.category, "Category"),
                createBottomNavigationBarItem(2, SvgPath.school, "School"),
                createBottomNavigationBarItem(3, SvgPath.profile, "Profile"),
              ],
            ),
          ),
        );
      },
    );
  }
}

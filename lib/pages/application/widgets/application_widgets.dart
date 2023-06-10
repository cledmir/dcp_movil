import 'package:dcp_movil/pages/diagnosis/diagnosis_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/common/values/colors.dart';
import 'package:dcp_movil/pages/home/home_page.dart';
import 'package:dcp_movil/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const DiagnosisPage(),
    const Center(child: Text("Course")),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      label: "Inicio",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/home.png"),
      ),
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/home.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: "Diagnosticos",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/search2.png"),
      ),
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/search2.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: "Información",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/play-circle1.png"),
      ),
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/search2.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: "Mi perfil",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/person2.png"),
      ),
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/person2.png",
          color: AppColors.primaryElement,
        ),
      ))
];

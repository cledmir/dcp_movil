import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

Widget reusableText(
  String text, {
  Color color = AppColors.primaryText,
  int fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
  int horizontalMargin = 0,
  int verticalMargin = 0,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
        vertical: verticalMargin.h, horizontal: horizontalMargin.w),
    child: Text(
      text,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
    ),
  );
}

Widget buildButton(String buttonName, String buttonType, void Function()? func,
    {int width = 325, int marginRight = 25, int marginLeft = 25}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width.w,
      height: 56.h,
      margin: EdgeInsets.only(
          left: marginLeft.w,
          right: marginRight.w,
          top: buttonType == "1" ? 40.h : 20.h),
      decoration: BoxDecoration(
          color: buttonType == "1"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(
            color: buttonType == "1"
                ? Colors.transparent
                : AppColors.primaryBackground,
          ),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: buttonType == "1"
                ? AppColors.primaryBackground
                : AppColors.primaryElement),
      )),
    ),
  );
}

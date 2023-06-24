import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Text(type,
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal)),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(left: 50.w, right: 50.w, bottom: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons("google"),
          _reusableIcons("apple"),
          _reusableIcons("facebook"),
        ],
      ));
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          height: 16.w,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintStyle:
                  const TextStyle(color: AppColors.primarySecondaryElementText),
            ),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenier",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    alignment: Alignment.center,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "¿Olvidaste tu contraseña?",
        style: TextStyle(
            color: AppColors.primaryElement,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            decorationColor: AppColors.primaryElement),
      ),
    ),
  );
}

Widget loginpartyText() {
  return Container(
    alignment: Alignment.center,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "o ingresa con",
        style: TextStyle(
            color: AppColors.primaryElement,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            decorationColor: Color(0xff0E1A30)),
      ),
    ),
  );
}

Widget createAccount(void Function()? func) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        height: 44.h,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            "¿Aún no tienes una cuenta? ",
            style: TextStyle(
                color: AppColors.primaryElement,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                decorationColor: AppColors.primaryElement),
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 44.h,
        child: GestureDetector(
          onTap: func,
          child: Text(
            "Crear cuenta",
            style: TextStyle(
                color: AppColors.primaryElement,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                fontSize: 16.sp,
                decorationColor: AppColors.primaryElement),
          ),
        ),
      ),
    ],
  );
}

Widget buildLogInAnfRegButton(
    String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 55.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
      decoration: BoxDecoration(
          color: buttonType == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(
            color:
                buttonType == "login" ? Colors.transparent : Colors.transparent,
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
            fontWeight: FontWeight.normal,
            color: buttonType == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryElement),
      )),
    ),
  );
}

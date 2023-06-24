import 'package:dcp_movil/common/values/colors.dart';
import 'package:dcp_movil/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget courseGrid(void Function() func,
    {Color backgroundColor = Colors.white,
    Color borderColor = Colors.white,
    String title = "",
    String subTitle = "",
    String img = "",
    int photoMargin = 1}) {
  return Card(
    color: backgroundColor,
    elevation: 0,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: borderColor,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    ),
    child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          children: [
            Container(
              margin: photoMargin == 1
                  ? EdgeInsets.only(right: 10.w)
                  : EdgeInsets.only(
                      top: 10.w, left: 10.w, bottom: 10.w, right: 20.w),
              height: photoMargin == 1 ? 100 : 80,
              width: photoMargin == 1 ? 100 : 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(img))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableText(title, fontSize: 15, fontWeight: FontWeight.w600),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  width: 190.w,
                  child: reusableText(subTitle,
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8.h,
                ),
                _tapText(Color(0xffb403C77), 15, func)
              ],
            )
          ],
        )),
  );
}

Widget _tapText(Color textColor, int textSize, void Function()? func) {
  return Container(
    child: GestureDetector(
      onTap: func,
      child: Text(
        "Ver más",
        style: TextStyle(
            color: textColor,
            decoration: TextDecoration.underline,
            fontSize: textSize.sp,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

import 'package:dcp_movil/common/entities/diagnostic.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/common/values/colors.dart';
import 'package:dcp_movil/common/widgets/base_text_widget.dart';
import 'package:dcp_movil/pages/diagnosis/bloc/diagnosis_page_blocs.dart';
import 'package:dcp_movil/pages/diagnosis/bloc/diagnosis_page_events.dart';
import 'package:dcp_movil/pages/diagnosis/bloc/diagnosis_page_states.dart';
import 'package:intl/intl.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/person.png"))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget diagnosisPageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: "Search your course",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle:
                      TextStyle(color: AppColors.primarySecondaryElementText),
                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenier",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
              ),
            ),
            GestureDetector(
              child: Container(
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.all(Radius.circular(13.w)),
                    border: Border.all(color: AppColors.primaryElement)),
                child: Image.asset("assets/icons/options.png"),
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context, DiagnosisPageStates states) {
  return Column(
    children: [
      Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 325.w,
          height: 160.h,
          child: PageView(
              onPageChanged: (value) {
                context
                    .read<DiagnosispageBlocs>()
                    .add(DiagnosisPageDots(value));
              },
              children: [
                _slidersContainer(path: "assets/icons/art.png"),
                _slidersContainer(path: "assets/icons/Image_1.png"),
                _slidersContainer(path: "assets/icons/Image_2.png"),
              ])),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: states.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course"),
            GestureDetector(
              child: reusableText("See all",
                  color: AppColors.primaryThirdElementText, fontSize: 10),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
            _reusableMenuText("Newest",
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 10.w),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backGroundColor)),
    child: reusableText(menuText,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}

Widget courseGrid(Diagnostic diagnostic) {
  return Center(
    child: Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xffbEBEEFC),
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              Container(
                margin: EdgeInsetsDirectional.symmetric(
                    vertical: 0.h, horizontal: 20.w),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(diagnostic.photoURL ??
                            "assets/icons/Image_2.png"))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      reusableText("Estado: "),
                      reusableText("Completado",
                          color: AppColors.completeColor),
                    ],
                  ),
                  Row(
                    children: [
                      reusableText("Fecha de realización: ",
                          fontSize: 12,
                          color: AppColors.primarySecondaryElementText,
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: 20.h,
                      ),
                      reusableText(
                          DateFormat('dd/MM/yyyy').format(
                              diagnostic.createdAt?.toDate() ?? DateTime.now()),
                          fontSize: 12,
                          color: AppColors.primarySecondaryElementText,
                          fontWeight: FontWeight.normal),
                    ],
                  )
                ],
              )
            ],
          )),
    ),
  );
}

Widget coursddeGrid() {
  return Container(
    //padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.w),
      border: Border.all(
        color: Colors.black,
      ),
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reusableText("Estado: "),
          reusableText("Pendiente", color: AppColors.alertColor),
        ]),
  );
}

Widget buildButton(
    String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 56.h,
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: buttonType == "1" ? 40.h : 20.h),
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

Widget imageWithBackground() {
  return Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 300.h,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            color: AppColors.primaryThirdBackground,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(top: 90.h),
            child: Image.asset(
              "assets/images/woman_doctor.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ],
  );
}

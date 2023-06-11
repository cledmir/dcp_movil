import 'package:dcp_movil/common/widgets/base_text_widget.dart';
import 'package:dcp_movil/pages/home/home_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/common/values/colors.dart';
import 'package:dcp_movil/pages/home/bloc/home_page_blocs.dart';
import 'package:dcp_movil/pages/home/bloc/home_page_states.dart';
import 'package:dcp_movil/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final FirebaseStorage storage = FirebaseStorage.instance;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //appBar: buildAppBar(),
        body: BlocBuilder<HomepageBlocs, HomePageStates>(
            builder: (context, state) {
          return Container(
            //margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWithBackground(),
                SizedBox(
                  height: 30.h,
                ),
                reusableText("Cuida tu piel, analiza tus manchas y/o lunares",
                    fontSize: 22, horizontalMargin: 25),
                SizedBox(
                  height: 10.h,
                ),
                reusableText("Selecciona una opción",
                    fontSize: 15,
                    color: AppColors.primarySecondaryElementText,
                    fontWeight: FontWeight.normal,
                    horizontalMargin: 25),
                buildButton("Tomar foto", "1", () async {
                  await HomeController(context: context).getImageFromCamera(1);
                }),
                buildButton("Seleccionar foto", "2", () async {
                  await HomeController(context: context).getImageFromCamera(2);
                })
              ],
            )),
          );
        }));
  }
}

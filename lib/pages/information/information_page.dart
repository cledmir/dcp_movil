import 'package:dcp_movil/common/widgets/base_text_widget.dart';
import 'package:dcp_movil/pages/Information/widgets/information_page_widgets.dart';
import 'package:dcp_movil/pages/information/lesions_page.dart';
import 'package:dcp_movil/pages/information/recomendations_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/common/values/colors.dart';
import 'package:dcp_movil/pages/information/bloc/information_page_blocs.dart';
import 'package:dcp_movil/pages/information/bloc/information_page_states.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //appBar: buildAppBar(),
        body: BlocBuilder<InformationpageBlocs, InformationPageStates>(
            builder: (context, state) {
          return SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableText("Datos informativos", fontSize: 22),
                const SizedBox(
                  height: 5,
                ),
                reusableText("Selecciona un tópico",
                    fontSize: 15,
                    color: AppColors.primarySecondaryElementText,
                    fontWeight: FontWeight.normal),
                SizedBox(
                  height: 10.h,
                ),
                courseGrid(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LesionsPage()),
                  );
                },
                    backgroundColor: Color(0xffbEDF0FF),
                    borderColor: Color(0xffbD2D9FE),
                    title: "Lesiones de la piel",
                    subTitle:
                        "Información detallada sobre una amplia variedad de condiciones cutáneas.",
                    img: "assets/images/dermatologist.png"),
                SizedBox(
                  height: 10.h,
                ),
                courseGrid(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecomendationsPage()),
                  );
                },
                    backgroundColor: Color(0xffbFFECE7),
                    borderColor: Color(0xffbFED6CB),
                    title: "Recomendaciones",
                    subTitle:
                        "Encontrarás consejos prácticos y útiles para mantener una piel saludable. ",
                    img: "assets/images/skin.png",
                    photoMargin: 2),
              ],
            ),
          ));
        }));
  }
}

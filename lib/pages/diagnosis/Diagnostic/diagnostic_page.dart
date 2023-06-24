import 'package:dcp_movil/common/entities/diagnostic.dart';
import 'package:dcp_movil/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/common/values/colors.dart';
import 'package:intl/intl.dart';

class DiagnosticPage extends StatefulWidget {
  final Diagnostic diagnostic;
  const DiagnosticPage(this.diagnostic, {super.key});

  @override
  State<DiagnosticPage> createState() => _DiagnosticPageState();
}

class _DiagnosticPageState extends State<DiagnosticPage> {
  Diagnostic diagnostic = Diagnostic();
  String photo = "";
  @override
  void initState() {
    super.initState();
    // Asignar el valor inicial del widget a la variable de MyClass
    diagnostic = widget.diagnostic;
    photo = diagnostic.photoURL ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              reusableText("Detalle del Diagnóstico", fontSize: 22),
              const SizedBox(
                height: 5,
              ),
              reusableText(
                  DateFormat('dd/MM/yyyy')
                      .format(diagnostic.createdAt?.toDate() ?? DateTime.now()),
                  fontSize: 15,
                  color: AppColors.primarySecondaryElementText,
                  fontWeight: FontWeight.normal),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 200.h,
                //padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(diagnostic.photoURL ??
                            "assets/icons/Image_2.png"))),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset("assets/icons/tipo-lesion.png"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  reusableText("Tipo de lesión", fontSize: 18),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: reusableText(diagnostic.result ?? "",
                    fontSize: 15,
                    color: AppColors.primarySecondaryElementText,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset("assets/icons/probabilidad.png"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  reusableText("Probabilidad/Severidad", fontSize: 18),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: reusableText(
                    "${diagnostic.probability!.toStringAsFixed(2)}%",
                    fontSize: 15,
                    color: AppColors.primarySecondaryElementText,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 100.h,
              ),
              buildButton("Compartir", "1", () {},
                  width: 400, marginLeft: 0, marginRight: 0),
            ],
          )),
        ));
  }
}

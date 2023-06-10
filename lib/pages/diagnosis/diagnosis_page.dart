import 'package:dcp_movil/common/entities/diagnostic.dart';
import 'package:dcp_movil/common/routes/names.dart';
import 'package:dcp_movil/common/service/firebase_service.dart';
import 'package:dcp_movil/common/widgets/base_text_widget.dart';
import 'package:dcp_movil/global.dart';
import 'package:dcp_movil/pages/diagnosis/Diagnostic/diagnostic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/common/values/colors.dart';
import 'package:dcp_movil/pages/diagnosis/bloc/diagnosis_page_blocs.dart';
import 'package:dcp_movil/pages/diagnosis/bloc/diagnosis_page_states.dart';
import 'package:dcp_movil/pages/diagnosis/widgets/diagnosis_page_widgets.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  final FirebaseService _firebaseService = FirebaseService.instance;

  late Future<List<Diagnostic>> diagnosticsFuture;

  @override
  void initState() {
    super.initState();
    diagnosticsFuture = initializeData();
  }

  Future<List<Diagnostic>> initializeData() async {
    final userId = Global.storageService.getUserId();
    return await _firebaseService.getDiagnosticsForUser(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Diagnostic>>(
        future: diagnosticsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se completa la operación asincrónica
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si ocurre algún error durante la carga
            return Center(
              child: Text('Error al cargar los datos'),
            );
          } else {
            // Construye la interfaz de usuario una vez que la operación asincrónica se ha completado
            final List<Diagnostic> diagnostics = snapshot.data!;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: reusableText("Últimos diagnósticos", fontSize: 22),
                  ),
                  SliverToBoxAdapter(
                    child: reusableText(
                      "Selecciona un hospital o clinica",
                      fontSize: 15,
                      color: AppColors.primarySecondaryElementText,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20.h),
                  ),
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 0.w),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 4,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final diagnostic = diagnostics[index];
                          return GestureDetector(
                            onTap: () {
                              // Acciones al hacer clic en un diagnóstico
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DiagnosticPage(diagnostic),
                                ),
                              );
                            },
                            child: courseGrid(diagnostic),
                          );
                        },
                        childCount: diagnostics.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

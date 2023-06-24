import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/base_text_widget.dart';

class RecomendationsPage extends StatefulWidget {
  const RecomendationsPage({Key? key}) : super(key: key);

  @override
  State<RecomendationsPage> createState() => _RecomendationsPageState();
}

class _RecomendationsPageState extends State<RecomendationsPage> {
  final List<Map<String, dynamic>> lesiones = [
    {
      'id': '10',
      'title': 'Protege tu piel del sol',
      'body':
          'La exposición al sol es uno de los principales factores de riesgo para las enfermedades de la piel, como las queratosis actínicas, el carcinoma de células basales y el melanoma. Para proteger tu piel, usa protector solar con un FPS de al menos 30 y evita la exposición al sol entre las 10 a.m. y las 4 p.m., cuando los rayos solares son más intensos.',
    },
    {
      'id': '12',
      'title': 'Observa tu piel',
      'body':
          'Es importante examinar regularmente tu piel en busca de cambios como manchas nuevas, lesiones, marcas o cambios en la forma, tamaño o color de las manchas existentes. Si notas algo sospechoso, haz una cita con un dermatólogo.',
    },
    {
      'id': '13',
      'title': 'Usa ropa protectora',
      'body':
          'Usar ropa de protección, como sombreros de ala ancha, camisas de manga larga y pantalones, puede ayudar a proteger la piel del sol.',
    },
    {
      'id': '14',
      'title': 'Mantén una buena higiene de la piel',
      'body':
          'Lavarse la piel regularmente con agua tibia y un jabón suave puede ayudar a prevenir infecciones y otros problemas de la piel.',
    },
  ];

  List<bool> _expandedList = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Container(
            child: reusableText("Recomendaciones"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.h, bottom: 100.h),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _expandedList[index] = !isExpanded;
                  });
                },
                children: [
                  for (int i = 0; i < lesiones.length; i++)
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                            lesiones[i]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                      body: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 15.w),
                        child: Text(
                          lesiones[i]['body'],
                        ),
                      ),
                      isExpanded: _expandedList[i],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

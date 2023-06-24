import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LesionsPage extends StatefulWidget {
  const LesionsPage({Key? key}) : super(key: key);

  @override
  State<LesionsPage> createState() => _LesionsPageState();
}

class _LesionsPageState extends State<LesionsPage> {
  final List<Map<String, dynamic>> lesiones = [
    {
      'id': '2',
      'title': 'Nevo melanocítico (Lunar)',
      'body':
          'Es una lesión pigmentada en la piel, también conocida como lunar. La mayoría de los nevos son inofensivos, pero algunos pueden convertirse en melanoma.',
    },
    {
      'id': '0',
      'title': 'Lesiones benignas similares a queratosis',
      'body':
          'Son manchas planas, ásperas y escamosas que aparecen en la piel debido a la exposición al sol. A menudo son inofensivas, pero pueden ser una señal de que la piel ha sufrido daño',
    },
    {
      'id': '1',
      'title': 'Dermatofibroma',
      'body':
          'Es una lesión pequeña y dura en la piel que generalmente es benigna. Por lo general, no requiere tratamiento a menos que cause irritación o incomodidad.',
    },
    {
      'id': '3',
      'title': 'Lesiones vasculares',
      'body':
          'Son lesiones en la piel causadas por un agrandamiento de los vasos sanguíneos. Incluyen manchas de vino de Oporto, hemangiomas y malformaciones vasculares.',
    },
    {
      'id': '4',
      'title': 'Queratosis actínicas',
      'body':
          'Son manchas escamosas y ásperas en la piel que se desarrollan como resultado de la exposición crónica al sol. Si se dejan sin tratar, pueden convertirse en un cáncer de piel más agresivo.',
    },
    {
      'id': '5',
      'title': 'Carcinoma de células basales',
      'body':
          'Es un tipo de cáncer de piel que se desarrolla en las células basales de la piel. Es el tipo de cáncer de piel más común y por lo general se puede tratar con éxito si se detecta temprano.',
    },
    {
      'id': '6',
      'title': 'Melanoma',
      'body':
          'Es un tipo de cáncer de piel que se desarrolla en los melanocitos, las células que producen pigmento en la piel. Es el tipo de cáncer de piel más peligroso y puede propagarse a otras partes del cuerpo si no se trata a tiempo.',
    },
  ];

  List<bool> _expandedList = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100.h, bottom: 100.h),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/common/values/colors.dart';
import 'package:dcp_movil/pages/application/bloc/app_blocs.dart';
import 'package:dcp_movil/pages/application/bloc/app_events.dart';
import 'package:dcp_movil/pages/application/bloc/app_states.dart';
import 'package:dcp_movil/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppSatate>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          body: buildPage(state.index),
          bottomNavigationBar: SizedBox(
            width: 375.w,
            height: 90.h,
            child: BottomNavigationBar(
                backgroundColor: AppColors.primaryBackground,
                currentIndex: state.index,
                onTap: (value) {
                  context.read<AppBlocs>().add(TrigerAppEvent(value));
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                //showSelectedLabels: false,
                //showUnselectedLabels: false,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,
                items: bottomTabs),
          ),
        )),
      );
    });
  }
}

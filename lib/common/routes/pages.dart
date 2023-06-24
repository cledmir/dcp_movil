import 'package:dcp_movil/pages/Information/information_page.dart';
import 'package:dcp_movil/pages/diagnosis/bloc/diagnosis_page_blocs.dart';
import 'package:dcp_movil/pages/diagnosis/diagnosis_page.dart';
import 'package:dcp_movil/pages/information/bloc/information_page_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcp_movil/common/routes/names.dart';
import 'package:dcp_movil/global.dart';
import 'package:dcp_movil/pages/Welcome/bloc/welcome_blocs.dart';
import 'package:dcp_movil/pages/Welcome/welcome.dart';
import 'package:dcp_movil/pages/application/application_page.dart';
import 'package:dcp_movil/pages/application/bloc/app_blocs.dart';
import 'package:dcp_movil/pages/home/bloc/home_page_blocs.dart';
import 'package:dcp_movil/pages/home/home_page.dart';
import 'package:dcp_movil/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:dcp_movil/pages/profile/settings/settings_pages.dart';
import 'package:dcp_movil/pages/register/bloc/register_blocs.dart';
import 'package:dcp_movil/pages/register/register.dart';
import 'package:dcp_movil/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:dcp_movil/pages/sign_in/sign_in.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SING_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBlocs(),
          )),
      PageEntity(
          route: AppRoutes.APLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBlocs(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomepageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS_PAGE,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBlocs(),
          )),
      PageEntity(
          route: AppRoutes.DIAGNOSIS_PAGE,
          page: const DiagnosisPage(),
          bloc: BlocProvider(
            create: (_) => DiagnosispageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.INFORMATION_PAGE,
          page: const InformationPage(),
          bloc: BlocProvider(
            create: (_) => InformationpageBlocs(),
          )),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }

    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}

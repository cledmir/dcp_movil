import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/common/routes/routes.dart';
import 'package:dcp_movil/common/values/colors.dart';
import 'package:dcp_movil/global.dart';
import 'package:flutter_svg/svg.dart';

Future<void> main() async {
  await Global.init();
  runApp(SplashApp());
}

class SplashApp extends StatelessWidget {
  final Future<String> splashScreenFuture = Future<String>.delayed(
    const Duration(seconds: 3),
    () => 'AppState',
  );
  SplashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<String>(
        future: splashScreenFuture,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          final size = MediaQuery.of(context).size;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SvgPicture.asset(
                    'assets/images/Dermacheck.svg',
                    width: size.width * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          } else {
            return const MyApp();
          }
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: AppColors.primaryText),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
          )),
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}

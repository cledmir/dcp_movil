import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:dcp_movil/pages/sign_in/bloc/sign_states.dart';
import 'package:dcp_movil/pages/sign_in/bloc/sing_in_events.dart';
import 'package:dcp_movil/pages/sign_in/sign_in_controller.dart';
//import 'package:dcp_movil/pages/sign_in/widgets/sing_in_widget.dart';
import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool shadowColor = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SingInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Iniciar Sesión"),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(
                  child: reusableText(
                      "O use su cuenta de correo electrónico para iniciar sesión")),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField("Ingresa tu email", "email", "user",
                          (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Contraseña"),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          "Ingresa tu contraseña", "password", "lock", (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      })
                    ]),
              ),
              forgotPassword(),
              SizedBox(
                height: 70.h,
              ),
              buildLogInAnfRegButton("Iniciar sesión", "login", () {
                SignInController(context: context).handleSingIn("email");
              }),
              buildLogInAnfRegButton("Registrarse", "register", () {
                Navigator.of(context).pushNamed("/register");
              })
            ],
          )),
        )),
      );
    });
  }
}

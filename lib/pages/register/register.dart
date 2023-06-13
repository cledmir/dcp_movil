import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dcp_movil/pages/register/bloc/register_blocs.dart';
import 'package:dcp_movil/pages/register/bloc/register_events.dart';
import 'package:dcp_movil/pages/register/bloc/register_state.dart';
import 'package:dcp_movil/pages/register/register_controller.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                  child: reusableText(
                      "Ingrese sus datos a continuación y regístrese")),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Nombre"),
                      buildTextField("Ingresa tu nombre", "name", "user",
                          (value) {
                        context.read<RegisterBlocs>().add(UserNameEvent(value));
                      }),
                      reusableText("Email"),
                      buildTextField("Ingresa tu email", "email", "user",
                          (value) {
                        context.read<RegisterBlocs>().add(EmailEvent(value));
                      }),
                      reusableText("Contraseña"),
                      buildTextField(
                          "Ingresa tu contraseña", "password", "lock", (value) {
                        context.read<RegisterBlocs>().add(PasswordEvent(value));
                      }),
                      reusableText("Repite tu Contreseña"),
                      buildTextField(
                          "Confirma tu contraseña", "password", "lock",
                          (value) {
                        context
                            .read<RegisterBlocs>()
                            .add(RePasswordEvent(value));
                      })
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                child: reusableText(
                    "Al crear una cuenta, debe aceptar nuestros términos y condiciones"),
              ),
              buildLogInAnfRegButton("Registrarse", "login", () {
                //Navigator.of(context).pushNamed("register");
                RegisterController(context: context).handleEmailRegister();
              })
            ],
          )),
        )),
      );
    });
  }
}

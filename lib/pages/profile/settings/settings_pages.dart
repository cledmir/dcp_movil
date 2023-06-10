import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcp_movil/common/routes/names.dart';
import 'package:dcp_movil/common/values/constant.dart';
import 'package:dcp_movil/global.dart';
import 'package:dcp_movil/pages/application/bloc/app_blocs.dart';
import 'package:dcp_movil/pages/application/bloc/app_events.dart';
import 'package:dcp_movil/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:dcp_movil/pages/profile/settings/bloc/settings_states.dart';
import 'package:dcp_movil/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(const TrigerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_ID);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingStates>(
            builder: (context, state) {
          return Container(
            child: Column(
              children: [
                settingsButton(context, removeUserData),
              ],
            ),
          );
        }),
      ),
    );
  }
}

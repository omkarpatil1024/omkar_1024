import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_states.dart';
import 'package:ulearning/pages/profile/settings/widgets/settings_widgets.dart';

import '../../../global.dart';
import '../../application/bloc/apps_blocs.dart';
import '../../application/bloc/apps_events.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    void removeUserData() {
      context.read<AppBlocs>().add(TriggerAppEvent(0));
      context.read<HomePageBlocs>().add(HomePageDots(0));
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
      Global.storageService.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
      Global.storageService.remove(AppConstant.STORAGE_USER_PROFILE_KEY);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
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
          },
        ),
      ),
    );
  }
}

import 'package:bloc_practice/app/logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final notificationSnackbar = SnackBar(
            duration: const Duration(milliseconds: 400),
            content: Text(
              'App: ${state.appNotifications.toString().toUpperCase()}, Email: ${state.emailNotifications.toString().toUpperCase()}',
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(notificationSnackbar);
        },
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return SafeArea(
                child: Column(
              children: [
                SwitchListTile(
                  title: const Text('App notification'),
                  value: state.appNotifications,
                  onChanged: (value) {
                    context.read<SettingsCubit>().toggleAppNotifications(value);
                  },
                ),
                SwitchListTile(
                  title: const Text('Email notification'),
                  value: state.emailNotifications,
                  onChanged: (value) {
                    context
                        .read<SettingsCubit>()
                        .toggleEmailNotifications(value);
                  },
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}

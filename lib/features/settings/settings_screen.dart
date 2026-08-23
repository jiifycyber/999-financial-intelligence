import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "Settings",
        subtitle:
            "Configure profile, security, notifications, and data permissions.",
        features: [
          "Profile",
          "Security",
          "Biometrics-ready settings",
          "Notifications",
          "Provider status",
          "Privacy controls"
        ],
      );
}

import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "Admin Portal",
        subtitle: "Manage users, providers, permissions, and audit controls.",
        features: [
          "User management",
          "Roles",
          "Provider configuration",
          "AI routing",
          "Audit logs",
          "Compliance controls"
        ],
      );
}

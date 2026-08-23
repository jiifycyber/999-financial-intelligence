import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class CrmScreen extends StatelessWidget {
  const CrmScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "CRM",
        subtitle: "Manage customers and workflow.",
        features: [
          "Customer profiles",
          "Notes",
          "Tasks",
          "Communication history",
          "Appointments",
          "Billing status"
        ],
      );
}

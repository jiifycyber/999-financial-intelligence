import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "Analytics",
        subtitle: "Track customer and platform outcomes.",
        features: [
          "Credit progress",
          "Grant submissions",
          "Grant awards",
          "Funding pipeline",
          "Client activity",
          "Workflow performance"
        ],
      );
}

import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class AiCoachScreen extends StatelessWidget {
  const AiCoachScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "AI Financial Coach",
        subtitle:
            "Specialized AI agents coordinated through one routing layer.",
        features: [
          "Credit Analyst Agent",
          "Grant Writer Agent",
          "Compliance Reviewer Agent",
          "Financial Coach Agent",
          "Document Intelligence Agent"
        ],
      );
}

import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class FundingScreen extends StatelessWidget {
  const FundingScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "Business Funding",
        subtitle: "Prepare businesses for legitimate funding opportunities.",
        features: [
          "Funding readiness assessment",
          "Business profile",
          "Document checklist",
          "Opportunity tracking",
          "Application preparation"
        ],
      );
}

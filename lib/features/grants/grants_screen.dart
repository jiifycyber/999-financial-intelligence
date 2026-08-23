import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class GrantsScreen extends StatelessWidget {
  const GrantsScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "Grant Center",
        subtitle: "Discover, draft, review, and track grant opportunities.",
        features: [
          "Grant discovery",
          "Eligibility matching",
          "Grants.gov connector",
          "Candid connector",
          "AI proposal writer",
          "Executive summary",
          "Needs statement",
          "Project narrative",
          "Goals and outcomes",
          "Budget narrative",
          "Compliance review",
          "Deadline tracker"
        ],
      );
}

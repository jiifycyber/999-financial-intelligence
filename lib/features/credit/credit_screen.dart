import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "Credit Center",
        subtitle: "AI-assisted credit analysis and improvement workflows.",
        features: [
          "Consumer-authorized credit data",
          "Three-bureau-ready provider layer",
          "Credit score history",
          "Utilization tracking",
          "Potential issue detection",
          "Dispute draft review",
          "Deadline tracking",
          "Debt payoff planner",
          "Payment reminders",
          "AI credit coach"
        ],
      );
}

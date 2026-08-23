import 'package:flutter/material.dart';
import '../../widgets/module_screen.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});
  @override
  Widget build(BuildContext context) => const ModuleScreen(
        title: "Document Vault",
        subtitle: "Organize financial and grant documents.",
        features: [
          "Credit reports",
          "Tax documents",
          "Financial statements",
          "Business plans",
          "Grant attachments",
          "Evidence files"
        ],
      );
}

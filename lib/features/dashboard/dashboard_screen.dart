import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const items = [
    ('Credit Center', '/credit', Icons.credit_score),
    ('Grant Center', '/grants', Icons.description),
    ('Business Funding', '/funding', Icons.account_balance),
    ('AI Financial Coach', '/ai-coach', Icons.auto_awesome),
    ('Document Vault', '/documents', Icons.folder),
    ('CRM', '/crm', Icons.people),
    ('Analytics', '/analytics', Icons.analytics),
    ('Admin', '/admin', Icons.admin_panel_settings),
    ('Settings', '/settings', Icons.settings),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('AI Financial Growth Pro')),
        body: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 280,
              mainAxisExtent: 150,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: items.length,
          itemBuilder: (_, i) {
            final item = items[i];
            return Card(
                child: InkWell(
              onTap: () => context.go(item.$2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.$3, size: 36),
                    const SizedBox(height: 12),
                    Text(item.$1, textAlign: TextAlign.center)
                  ]),
            ));
          },
        ),
      );
}

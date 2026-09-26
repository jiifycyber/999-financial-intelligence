import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FinancialIntelligenceApp());
}

class FinancialIntelligenceApp extends StatelessWidget {
  const FinancialIntelligenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '999 Financial Intelligence',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}

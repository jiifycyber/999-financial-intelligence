import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const FinancialIntelligenceApp());
}

class FinancialIntelligenceApp extends StatelessWidget {
  const FinancialIntelligenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '999 Financial Intelligence',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const FinancialShell(),
    );
  }
}

class FinancialShell extends StatefulWidget {
  const FinancialShell({super.key});

  @override
  State<FinancialShell> createState() => _FinancialShellState();
}

class _FinancialShellState extends State<FinancialShell> {
  int selectedIndex = 0;

  final items = const [
    ('Command Center', Icons.dashboard_customize_outlined),
    ('Credit Intelligence', Icons.credit_score_outlined),
    ('Grant Intelligence', Icons.description_outlined),
    ('Business Funding', Icons.account_balance_outlined),
    ('AI Financial Coach', Icons.psychology_outlined),
    ('Documents', Icons.folder_copy_outlined),
    ('CRM', Icons.groups_2_outlined),
    ('Analytics', Icons.query_stats_outlined),
    ('Admin', Icons.admin_panel_settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 760;

        return Scaffold(
          backgroundColor: AppTheme.bg,
          body: SafeArea(
            child: Column(
              children: [
                _topBar(mobile),
                Expanded(
                  child: Row(
                    children: [
                      if (!mobile) _sidebar(),
                      Expanded(
                        child: _content(),
                      ),
                    ],
                  ),
                ),
                if (mobile) _mobileNav(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _topBar(bool mobile) {
    return Container(
      height: mobile ? 62 : 72,
      padding: EdgeInsets.symmetric(horizontal: mobile ? 14 : 20),
      decoration: const BoxDecoration(
        color: Color(0xFF070B15),
        border: Border(
          bottom: BorderSide(color: AppTheme.border),
        ),
      ),
      child: Row(
        children: [
          const Text(
            '999',
            style: TextStyle(
              color: AppTheme.purple,
              fontSize: 27,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FINANCIAL INTELLIGENCE',
                  style: TextStyle(
                    color: AppTheme.text,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'AI FINANCIAL GROWTH OPERATING SYSTEM',
                  style: TextStyle(
                    color: AppTheme.muted,
                    fontSize: 7,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF0B291A),
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: AppTheme.green),
            ),
            child: const Text(
              'AI ONLINE',
              style: TextStyle(
                color: AppTheme.green,
                fontSize: 8,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFF261A43),
            child: Icon(
              Icons.psychology,
              color: AppTheme.purple,
              size: 21,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sidebar() {
    return Container(
      width: 235,
      color: const Color(0xFF070B15),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                borderRadius: BorderRadius.circular(9),
                child: Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: selectedIndex == i
                        ? const Color(0xFF20183B)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(9),
                    border: selectedIndex == i
                        ? Border.all(
                            color: AppTheme.purple.withValues(alpha: .5),
                          )
                        : null,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        items[i].$2,
                        color: selectedIndex == i
                            ? AppTheme.purple
                            : AppTheme.muted,
                        size: 20,
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: Text(
                          items[i].$1,
                          style: TextStyle(
                            color: selectedIndex == i
                                ? AppTheme.text
                                : AppTheme.muted,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF151126),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.purple.withValues(alpha: .4),
                ),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFF2B1C49),
                    child: Icon(
                      Icons.psychology,
                      color: AppTheme.purple,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 9),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Agent Duke',
                          style: TextStyle(
                            color: AppTheme.text,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Financial AI Online',
                          style: TextStyle(
                            color: AppTheme.green,
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mobileNav() {
    const indexes = [0, 1, 2, 3, 4];
    const labels = ['HOME', 'CREDIT', 'GRANTS', 'FUNDING', 'AI'];

    return Container(
      height: 66,
      decoration: const BoxDecoration(
        color: Color(0xFF070B15),
        border: Border(
          top: BorderSide(color: AppTheme.border),
        ),
      ),
      child: Row(
        children: [
          for (var x = 0; x < indexes.length; x++)
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = indexes[x];
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      items[indexes[x]].$2,
                      color: selectedIndex == indexes[x]
                          ? AppTheme.purple
                          : AppTheme.muted,
                      size: 21,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      labels[x],
                      style: TextStyle(
                        color: selectedIndex == indexes[x]
                            ? AppTheme.text
                            : AppTheme.muted,
                        fontSize: 7,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _content() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF060A14),
            Color(0xFF0A1020),
            Color(0xFF050812),
          ],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.panel,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.border),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                items[selectedIndex].$2,
                size: 46,
                color: AppTheme.purple,
              ),
              const SizedBox(height: 14),
              Text(
                items[selectedIndex].$1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppTheme.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                '999 Financial Intelligence platform rebuild in progress.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.muted,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinancialConnectDashboard extends StatefulWidget {
  const FinancialConnectDashboard({super.key});

  @override
  State<FinancialConnectDashboard> createState() =>
      _FinancialConnectDashboardState();
}

class _FinancialConnectDashboardState extends State<FinancialConnectDashboard> {
  final TextEditingController _command = TextEditingController();

  @override
  void dispose() {
    _command.dispose();
    super.dispose();
  }

  void _runCommand(String value) {
    final q = value.trim().toLowerCase();

    if (q.isEmpty) return;

    if (q.contains('credit') ||
        q.contains('score') ||
        q.contains('debt') ||
        q.contains('utilization')) {
      context.go('/credit');
      return;
    }

    if (q.contains('grant')) {
      context.go('/grants');
      return;
    }

    if (q.contains('fund') || q.contains('loan') || q.contains('capital')) {
      context.go('/funding');
      return;
    }

    context.go('/ai-coach');
  }

  Widget _statusTile({
    required IconData icon,
    required String title,
    required String value,
    required Color accent,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(17),
        child: Container(
          constraints: const BoxConstraints(minHeight: 70),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF07162C),
                Color(0xFF081D39),
              ],
            ),
            border: Border.all(
              color: accent.withValues(alpha: .34),
            ),
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: .10),
                blurRadius: 18,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: accent, size: 20),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: accent,
                        fontSize: 6.2,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickAction({
    required String label,
    required IconData icon,
    required Color accent,
    required String route,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              accent.withValues(alpha: .18),
              const Color(0xFF091321),
            ],
          ),
          border: Border.all(
            color: accent.withValues(alpha: .29),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: accent, size: 14),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: accent,
                fontSize: 8,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _activity({
    required IconData icon,
    required String title,
    required String time,
    required Color accent,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1934).withValues(alpha: .72),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: accent.withValues(alpha: .16),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: accent, size: 16),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFD2DBF2),
                fontSize: 9,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: Color(0xFF7182A8),
              fontSize: 7.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        final compact = box.maxWidth < 430;
        final desktop = box.maxWidth >= 820;

        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              compact ? 23 : 30,
            ),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF100526),
                Color(0xFF071838),
                Color(0xFF031020),
              ],
            ),
            border: Border.all(
              color: const Color(0xFF3EDBFF).withValues(alpha: .52),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF783EFF).withValues(alpha: .20),
                blurRadius: 42,
              ),
              BoxShadow(
                color: const Color(0xFF20CFFF).withValues(alpha: .08),
                blurRadius: 55,
              ),
            ],
          ),
          child: Stack(
            children: [
              const Positioned.fill(
                child: IgnorePointer(
                  child: CustomPaint(
                    painter: _FinancialGridPainter(),
                  ),
                ),
              ),
              Positioned(
                top: -95,
                right: -70,
                child: Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF3ADFFF).withValues(alpha: .14),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  compact ? 14 : 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) => const LinearGradient(
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFD88AFF),
                                    Color(0xFF58DFFF),
                                  ],
                                ).createShader(rect),
                                child: Text(
                                  '999 FINANCIAL INTELLIGENCE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: compact
                                        ? 20
                                        : desktop
                                            ? 30
                                            : 25,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -.7,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'CREDIT. FUNDING. GRANTS. REAL GROWTH.',
                                style: TextStyle(
                                  color: const Color(0xFFB8C5E2),
                                  fontSize: compact ? 6.5 : 8,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: compact ? 9 : 12,
                            vertical: compact ? 8 : 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF073D31),
                                Color(0xFF06251E),
                              ],
                            ),
                            border: Border.all(
                              color: const Color(0xFF42FFC0)
                                  .withValues(alpha: .65),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF34FFB0)
                                    .withValues(alpha: .18),
                                blurRadius: 18,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFF44FFB6),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(
                                            0xFF44FFB6,
                                          ).withValues(alpha: .80),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'AI ONLINE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: compact ? 7.5 : 9,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'FINANCIAL CORE ACTIVE',
                                style: TextStyle(
                                  color: const Color(0xFF53E9B2),
                                  fontSize: compact ? 4.8 : 5.8,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: compact ? 14 : 20),
                    Center(
                      child: SizedBox(
                        width: compact ? 240 : 300,
                        height: compact ? 240 : 300,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: compact ? 218 : 270,
                              height: compact ? 218 : 270,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    const Color(0xFF763BFF)
                                        .withValues(alpha: .34),
                                    const Color(0xFF1168FF)
                                        .withValues(alpha: .16),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            CustomPaint(
                              painter: const _FinancialOrbPainter(),
                              child: SizedBox(
                                width: compact ? 205 : 255,
                                height: compact ? 205 : 255,
                              ),
                            ),
                            Container(
                              width: compact ? 116 : 145,
                              height: compact ? 116 : 145,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const RadialGradient(
                                  colors: [
                                    Color(0xFF3D5DFF),
                                    Color(0xFF6A28DB),
                                    Color(0xFF07152E),
                                  ],
                                ),
                                border: Border.all(
                                  color: const Color(0xFF7DE9FF),
                                  width: 1.4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF6C38FF).withValues(
                                      alpha: .62,
                                    ),
                                    blurRadius: 36,
                                    spreadRadius: 5,
                                  ),
                                  BoxShadow(
                                    color: const Color(0xFF2DDCFF).withValues(
                                      alpha: .48,
                                    ),
                                    blurRadius: 46,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.account_balance_wallet_rounded,
                                color: Colors.white,
                                size: compact ? 50 : 64,
                              ),
                            ),
                            Positioned(
                              left: 2,
                              top: compact ? 58 : 72,
                              child: Text(
                                'UNDERSTAND\nYOUR CREDIT',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFFCAD5EF),
                                  fontSize: compact ? 6.2 : 7.3,
                                  fontWeight: FontWeight.w800,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: compact ? 58 : 72,
                              child: Text(
                                'PERSONALIZED\nSTRATEGY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFFCAD5EF),
                                  fontSize: compact ? 6.2 : 7.3,
                                  fontWeight: FontWeight.w800,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: compact ? 35 : 48,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFF071A38)
                                      .withValues(alpha: .86),
                                  border: Border.all(
                                    color: const Color(0xFF60E7FF).withValues(
                                      alpha: .40,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  '999 FINANCIAL CORE',
                                  style: TextStyle(
                                    color: Color(0xFF74E8FF),
                                    fontSize: 7,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: .8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        _statusTile(
                          icon: Icons.credit_score_rounded,
                          title: 'CREDIT NETWORK',
                          value: 'READY',
                          accent: const Color(0xFF41EDB0),
                          onTap: () => context.go('/credit'),
                        ),
                        const SizedBox(width: 7),
                        _statusTile(
                          icon: Icons.account_balance_rounded,
                          title: 'FUNDING',
                          value: 'READY TO SCAN',
                          accent: const Color(0xFF5AD9FF),
                          onTap: () => context.go('/funding'),
                        ),
                        const SizedBox(width: 7),
                        _statusTile(
                          icon: Icons.bolt_rounded,
                          title: 'AI ENGINE',
                          value: 'ONLINE',
                          accent: const Color(0xFFAE72FF),
                          onTap: () => context.go('/ai-coach'),
                        ),
                      ],
                    ),
                    SizedBox(height: compact ? 13 : 18),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF10275C),
                            Color(0xFF143D78),
                            Color(0xFF0A2451),
                          ],
                        ),
                        border: Border.all(
                          color: const Color(0xFF48DFFF).withValues(alpha: .62),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                const Color(0xFF3E7DFF).withValues(alpha: .22),
                            blurRadius: 24,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _command,
                        onSubmitted: _runCommand,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: compact ? 11 : 12,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What do you want to improve today?',
                          hintStyle: TextStyle(
                            color: const Color(0xFFC9D5EE),
                            fontSize: compact ? 13 : 15,
                            fontWeight: FontWeight.w700,
                          ),
                          helperText:
                              'Ask about credit, debt, funding, grants or financial strategy',
                          helperStyle: TextStyle(
                            color: const Color(0xFF8698BA),
                            fontSize: compact ? 7 : 8,
                          ),
                          prefixIcon: const Icon(
                            Icons.auto_awesome_rounded,
                            color: Color(0xFF8BEAFF),
                          ),
                          suffixIcon: Container(
                            margin: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF9B31FF),
                                  Color(0xFF536EFF),
                                  Color(0xFF34E8FF),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF8548FF).withValues(
                                    alpha: .45,
                                  ),
                                  blurRadius: 18,
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () => _runCommand(_command.text),
                              icon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: compact ? 11 : 14),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _quickAction(
                            label: 'Credit Score',
                            icon: Icons.credit_score_rounded,
                            accent: const Color(0xFFB56AFF),
                            route: '/credit',
                          ),
                          const SizedBox(width: 7),
                          _quickAction(
                            label: 'Pay Debt',
                            icon: Icons.trending_down_rounded,
                            accent: const Color(0xFF51E0D4),
                            route: '/credit',
                          ),
                          const SizedBox(width: 7),
                          _quickAction(
                            label: 'Funding',
                            icon: Icons.account_balance_rounded,
                            accent: const Color(0xFF57CFFF),
                            route: '/funding',
                          ),
                          const SizedBox(width: 7),
                          _quickAction(
                            label: 'Grants',
                            icon: Icons.description_rounded,
                            accent: const Color(0xFFFFBF55),
                            route: '/grants',
                          ),
                          const SizedBox(width: 7),
                          _quickAction(
                            label: 'Agent Duke',
                            icon: Icons.psychology_alt_rounded,
                            accent: const Color(0xFFFF69C9),
                            route: '/ai-coach',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: compact ? 13 : 17),
                    Container(
                      padding: EdgeInsets.all(compact ? 11 : 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF07162F),
                            Color(0xFF08132B),
                          ],
                        ),
                        border: Border.all(
                          color: const Color(0xFF536FFF).withValues(alpha: .30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.history_rounded,
                                color: Color(0xFF58E6FF),
                                size: 17,
                              ),
                              SizedBox(width: 7),
                              Text(
                                'RECENT FINANCIAL ACTIVITY',
                                style: TextStyle(
                                  color: Color(0xFFDCE6FB),
                                  fontSize: 9,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: .6,
                                ),
                              ),
                            ],
                          ),
                          _activity(
                            icon: Icons.auto_awesome_rounded,
                            title: 'Agent Duke financial intelligence ready',
                            time: 'LIVE',
                            accent: const Color(0xFF9D72FF),
                          ),
                          _activity(
                            icon: Icons.credit_score_rounded,
                            title: 'Credit intelligence module ready',
                            time: 'NOW',
                            accent: const Color(0xFF41EDB0),
                          ),
                          _activity(
                            icon: Icons.account_balance_rounded,
                            title: 'Funding readiness engine active',
                            time: 'ACTIVE',
                            accent: const Color(0xFF55DFFF),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    InkWell(
                      onTap: () => context.go('/ai-coach'),
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF251056),
                              Color(0xFF0C3B68),
                            ],
                          ),
                          border: Border.all(
                            color:
                                const Color(0xFF7D5FFF).withValues(alpha: .48),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.psychology_alt_rounded,
                              color: Color(0xFFB982FF),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Need a financial strategy?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Ask Agent Duke about credit, funding, grants or debt.',
                                    style: TextStyle(
                                      color: Color(0xFF9EACCA),
                                      fontSize: 7.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xFF7182A8),
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FinancialGridPainter extends CustomPainter {
  const _FinancialGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4A62B7).withValues(alpha: .10)
      ..strokeWidth = .7;

    const gap = 34.0;

    for (double x = 0; x <= size.width; x += gap) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y <= size.height; y += gap) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant _FinancialGridPainter oldDelegate,
  ) =>
      false;
}

class _FinancialOrbPainter extends CustomPainter {
  const _FinancialOrbPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radii = [
      size.width * .47,
      size.width * .41,
      size.width * .34,
    ];

    final colors = [
      const Color(0xFF48DFFF).withValues(alpha: .28),
      const Color(0xFF8A55FF).withValues(alpha: .24),
      const Color(0xFFFF43CB).withValues(alpha: .13),
    ];

    for (var i = 0; i < radii.length; i++) {
      canvas.drawCircle(
        center,
        radii[i],
        Paint()
          ..color = colors[i]
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2,
      );
    }

    final nodePaint = Paint()
      ..color = const Color(0xFF6DEAFF).withValues(alpha: .75);

    for (var i = 0; i < 10; i++) {
      final angle = (math.pi * 2 / 10) * i;
      final r = size.width * .43;

      canvas.drawCircle(
        Offset(
          center.dx + math.cos(angle) * r,
          center.dy + math.sin(angle) * r,
        ),
        2.2,
        nodePaint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant _FinancialOrbPainter oldDelegate,
  ) =>
      false;
}

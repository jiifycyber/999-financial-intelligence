import 'package:go_router/go_router.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/credit/credit_screen.dart';
import '../../features/grants/grants_screen.dart';
import '../../features/funding/funding_screen.dart';
import '../../features/ai_coach/ai_coach_screen.dart';
import '../../features/documents/documents_screen.dart';
import '../../features/crm/crm_screen.dart';
import '../../features/analytics/analytics_screen.dart';
import '../../features/admin/admin_screen.dart';
import '../../features/settings/settings_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (_, __) => const DashboardScreen()),
  GoRoute(path: '/credit', builder: (_, __) => const CreditScreen()),
  GoRoute(path: '/grants', builder: (_, __) => const GrantsScreen()),
  GoRoute(path: '/funding', builder: (_, __) => const FundingScreen()),
  GoRoute(path: '/ai-coach', builder: (_, __) => const AiCoachScreen()),
  GoRoute(path: '/documents', builder: (_, __) => const DocumentsScreen()),
  GoRoute(path: '/crm', builder: (_, __) => const CrmScreen()),
  GoRoute(path: '/analytics', builder: (_, __) => const AnalyticsScreen()),
  GoRoute(path: '/admin', builder: (_, __) => const AdminScreen()),
  GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
]);

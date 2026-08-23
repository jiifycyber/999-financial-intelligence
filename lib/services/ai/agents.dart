import 'ai_router.dart';

class CreditAnalystAgent {
  final AIRouter router;
  CreditAnalystAgent(this.router);
  Future<String> analyze(String p, Map<String, dynamic> c) =>
      router.run(AITaskType.creditAnalysis, p, context: c);
}

class GrantWriterAgent {
  final AIRouter router;
  GrantWriterAgent(this.router);
  Future<String> draft(String p, Map<String, dynamic> c) =>
      router.run(AITaskType.grantWriting, p, context: c);
}

class ComplianceReviewerAgent {
  final AIRouter router;
  ComplianceReviewerAgent(this.router);
  Future<String> review(String p, Map<String, dynamic> c) =>
      router.run(AITaskType.complianceReview, p, context: c);
}

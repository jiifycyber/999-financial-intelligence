import 'ai_provider.dart';

enum AITaskType {
  creditAnalysis,
  grantWriting,
  complianceReview,
  coaching,
  documentReview
}

class AIRouter {
  final AIProvider provider;
  AIRouter(this.provider);
  Future<String> run(AITaskType task, String prompt,
      {Map<String, dynamic>? context}) {
    final system = switch (task) {
      AITaskType.creditAnalysis =>
        'Analyze credit information for legitimate potential errors and improvement steps. Never promise deletion of accurate information.',
      AITaskType.grantWriting =>
        'Draft grant content using verified facts only. Never invent eligibility, revenue, impact, certifications, or outcomes.',
      AITaskType.complianceReview =>
        'Review for unsupported claims, missing facts, incomplete requirements, and risky promises.',
      AITaskType.coaching =>
        'Provide financial education and next-step guidance without guarantees.',
      AITaskType.documentReview =>
        'Extract and summarize verified document facts; identify missing information.'
    };
    return provider.generate(
        systemPrompt: system, userPrompt: prompt, context: context);
  }
}

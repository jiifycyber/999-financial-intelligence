import '../ai/ai_router.dart';

class DocumentIntelligenceService {
  final AIRouter ai;
  DocumentIntelligenceService(this.ai);
  Future<String> summarize(String text, {Map<String, dynamic>? context}) =>
      ai.run(AITaskType.documentReview,
          'Summarize and list verified facts and missing information:\n$text',
          context: context);
}

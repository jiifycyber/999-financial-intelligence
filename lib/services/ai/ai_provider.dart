abstract class AIProvider {
  String get name;
  Future<String> generate(
      {required String systemPrompt,
      required String userPrompt,
      Map<String, dynamic>? context});
}

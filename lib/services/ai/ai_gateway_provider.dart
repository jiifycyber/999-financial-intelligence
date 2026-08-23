import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/config/app_config.dart';
import 'ai_provider.dart';

class AIGatewayProvider implements AIProvider {
  @override
  String get name => 'secure-ai-gateway';
  @override
  Future<String> generate(
      {required String systemPrompt,
      required String userPrompt,
      Map<String, dynamic>? context}) async {
    if (AppConfig.aiGatewayUrl.isEmpty)
      throw StateError('AI_GATEWAY_URL is not configured.');
    final r = await http.post(Uri.parse(AppConfig.aiGatewayUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'systemPrompt': systemPrompt,
          'userPrompt': userPrompt,
          'context': context ?? {}
        }));
    if (r.statusCode >= 400)
      throw Exception('AI gateway error: ${r.statusCode}');
    final data = jsonDecode(r.body) as Map<String, dynamic>;
    return (data['text'] ?? '').toString();
  }
}

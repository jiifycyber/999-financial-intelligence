class AppConfig {
  static const supabaseUrl =
      String.fromEnvironment('SUPABASE_URL', defaultValue: '');
  static const supabaseAnonKey =
      String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');
  static const aiGatewayUrl =
      String.fromEnvironment('AI_GATEWAY_URL', defaultValue: '');
  static const creditGatewayUrl =
      String.fromEnvironment('CREDIT_GATEWAY_URL', defaultValue: '');
  static const grantGatewayUrl =
      String.fromEnvironment('GRANT_GATEWAY_URL', defaultValue: '');
}

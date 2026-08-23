import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  SupabaseClient get client => Supabase.instance.client;
  Future<List<Map<String, dynamic>>> getGrantApplications() async =>
      List<Map<String, dynamic>>.from(
          await client.from('grant_applications').select());
}

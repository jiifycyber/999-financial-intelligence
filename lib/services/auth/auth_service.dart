import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  SupabaseClient get _c => Supabase.instance.client;
  Future<AuthResponse> signIn(String email, String password) =>
      _c.auth.signInWithPassword(email: email, password: password);
  Future<void> signOut() => _c.auth.signOut();
}

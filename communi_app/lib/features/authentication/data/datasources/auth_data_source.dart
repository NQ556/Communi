import 'package:communi_app/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSource {
  Future<String> signInWithPhoneNumber({
    required String email,
    required String password,
  });

  Future<String> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final SupabaseClient supabaseClient;

  AuthDataSourceImpl(this.supabaseClient);

  @override
  Future<String> signInWithPhoneNumber({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'username': username,
        },
      );

      if (response.user == null) {
        throw ServerException("User is null");
      }

      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

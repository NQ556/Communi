import 'package:communi_app/core/error/exception.dart';
import 'package:communi_app/features/authentication/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSource {
  Session? get currentUserSession;

  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();
}

class AuthDataSourceImpl implements AuthDataSource {
  final SupabaseClient supabaseClient;

  AuthDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user == null) {
        throw const ServerException("User is null");
      }

      return UserModel.fromJson(response.user!.toJson()).copyWith(
        email: currentUserSession!.user.email,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmail({
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

      return UserModel.fromJson(response.user!.toJson()).copyWith(
        email: currentUserSession!.user.email,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);

        return UserModel.fromJson(userData.first).copyWith(
          email: currentUserSession!.user.email,
        );
      }

      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

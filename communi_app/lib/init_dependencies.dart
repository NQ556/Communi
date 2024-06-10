import 'package:communi_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:communi_app/env/env.dart';
import 'package:communi_app/features/authentication/data/datasources/auth_data_source.dart';
import 'package:communi_app/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:communi_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:communi_app/features/authentication/domain/usecase/current_user.dart';
import 'package:communi_app/features/authentication/domain/usecase/user_sign_in.dart';
import 'package:communi_app/features/authentication/domain/usecase/user_sign_up.dart';
import 'package:communi_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:communi_app/features/chat_room/data/datasources/chat_room_data_source.dart';
import 'package:communi_app/features/chat_room/data/repository/chat_room_repository_impl.dart';
import 'package:communi_app/features/chat_room/domain/repository/chat_room_repository.dart';
import 'package:communi_app/features/chat_room/domain/usecase/add_chat_room.dart';
import 'package:communi_app/features/chat_room/presentation/bloc/chat_room_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initChatRoom();

  final supabase = await Supabase.initialize(
    url: Env.url,
    anonKey: Env.apiKey,
  );

  getIt.registerLazySingleton(() => supabase.client);

  getIt.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  getIt.registerFactory<AuthDataSource>(
    () => AuthDataSourceImpl(
      getIt(),
    ),
  );

  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => UserSignUp(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => UserSignIn(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => CurrentUser(
      getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AuthBloc(
      userSignUp: getIt(),
      userSignIn: getIt(),
      currentUser: getIt(),
      appUserCubit: getIt(),
    ),
  );
}

void _initChatRoom() {
  getIt.registerFactory<ChatRoomDataSource>(
    () => ChatRoomDataSourceImpl(
      getIt(),
    ),
  );

  getIt.registerFactory<ChatRoomRepository>(
    () => ChatRoomRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => AddChatRoom(
      getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => ChatRoomBloc(
      getIt(),
    ),
  );
}

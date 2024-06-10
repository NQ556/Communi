import 'package:communi_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:communi_app/core/utils/route_manager.dart';
import 'package:communi_app/core/utils/theme_manager.dart';
import 'package:communi_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:communi_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:communi_app/features/home/presentation/pages/home_page.dart';
import 'package:communi_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => getIt<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserSignedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserSignedIn;
        },
        builder: (context, isSignedIn) {
          if (isSignedIn) {
            return HomePage();
          }

          return SignInPage();
        },
      ),
      theme: getApplicationTheme(),
    );
  }
}

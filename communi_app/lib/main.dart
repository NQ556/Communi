import 'package:communi_app/core/utils/route_manager.dart';
import 'package:communi_app/core/utils/theme_manager.dart';
import 'package:communi_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:communi_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.signInRoute,
      theme: getApplicationTheme(),
    );
  }
}

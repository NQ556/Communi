import 'package:communi_app/core/utils/route_manager.dart';
import 'package:communi_app/core/utils/theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

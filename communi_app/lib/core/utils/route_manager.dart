import 'package:communi_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:communi_app/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:communi_app/features/chat/presentation/pages/chat_page.dart';
import 'package:communi_app/core/common/entities/chat_room.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String signInRoute = "/";
  static const String signUpRoute = "/signUp";
  static const String chatRoute = "/chat";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case Routes.chatRoute:
        if (routeSettings.arguments is ChatRoom) {
          final chatRoom = routeSettings.arguments as ChatRoom;
          return MaterialPageRoute(
              builder: (_) => ChatPage(chatRoom: chatRoom));
        } else {
          return unDefinedRoute();
        }
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text("No Route Found"),
            ),
            body: Center(
              child: Text("No Route Found"),
            ),
          ));
}

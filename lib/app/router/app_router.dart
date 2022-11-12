import 'package:flutter/material.dart';
import 'package:mvvm_counter/ui/screens/loader/loader_screen.dart';

import '../../ui/screens/auth/auth_screen.dart';
import '../../ui/screens/home/home_screen.dart';

class AppRouteName {
  AppRouteName._();

  static const auth = 'auth';
  static const loader = 'loader'; // /main_screen
  static const home = 'home';
}

class AppRoute {
  AppRoute._();

  static final routes = <String, Widget Function(BuildContext)>{
    AppRouteName.loader: (_) => LoaderScreen.assembly(),
  };

  static Route<Object> onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRouteName.auth) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AuthScreen.assembly(),
        transitionDuration: Duration.zero,
      );
    } else if (settings.name == AppRouteName.home) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            HomeScreen.assembly(),
        transitionDuration: Duration.zero,
      );
    }
    return MaterialPageRoute(
        builder: (context) => const Text('Navigation error'));
  }
}

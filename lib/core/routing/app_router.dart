import 'package:flutter/material.dart';
import 'package:mcr/core/routing/routes.dart';
import 'package:mcr/feature/home/ui/page/notes_view.dart';
import 'package:mcr/feature/home/ui/page/home_view.dart';

import '../../feature/splash/splash_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
       return MaterialPageRoute(builder: (_) => const SplashScreen());
case Routes.homeView:
       return MaterialPageRoute(builder: (_) => const HomeView());
case Routes.notesView:
       return MaterialPageRoute(builder: (_) => const NotesView());


    }
    return null;
  }
}

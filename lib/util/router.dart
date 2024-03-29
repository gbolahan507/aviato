import 'package:aviato/ui/screen/homeScreen.dart';
import 'package:aviato/ui/screen/splash_screen.dart';
import 'package:aviato/util/util_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    case SplashView:
      return _getPageRoute(
        routeName: settings.name,
        view:  SplashScreen(),
      );
    case HomeScreenView:
      return _getPageRoute(
        routeName: settings.name,
        view:  HomeScreen(),
        args: settings.arguments,
      );
    // case BottomNavView:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     view:  NavigationScreen(),
    //     args: settings.arguments,
    //   );
 

    default:
      return CupertinoPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute<dynamic> _getPageRoute({String routeName, Widget view, Object args}) {
  return CupertinoPageRoute<dynamic>(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => view);
}


void routeTo(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.push<void>(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}

void routeToReplace(BuildContext context, Widget view) {
  Navigator.pushAndRemoveUntil<void>(
      context,
      CupertinoPageRoute<dynamic>(builder: (BuildContext context) => view),
      (Route<void> route) => false);
}

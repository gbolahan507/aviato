import 'package:aviato/core/storage/local_storage.dart';
import 'package:aviato/ui/screen/splash_screen.dart';
import 'package:aviato/util/constant/locator.dart';
import 'package:aviato/util/dialog_manager.dart';
import 'package:aviato/util/dialog_service.dart';
import 'package:aviato/util/navigator.dart';
import 'package:aviato/util/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache.init(); //Initialize Hive for Flutter
  setupLocator();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme:
                  GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
              primaryColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SplashScreen(),
          builder: (BuildContext context, Widget child) => Navigator(
              key: locator<DialogService>().dialogNavigationKey,
              onGenerateRoute: (RouteSettings settings) =>
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          DialogManager(child: child))),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: generateRoute,
        ));
  }
}

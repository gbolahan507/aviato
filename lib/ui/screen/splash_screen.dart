import 'package:aviato/core/view_model/startup_vm.dart';
import 'package:aviato/util/styles.dart';
import 'package:aviato/util/util_export.dart';
import 'package:aviato/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Tween<double> _scaleTween = Tween<double>(begin: 0, end: 200);
  NavigationService navigate = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
      onModelReady: (StartUpViewModel model) {},
      builder: (_, StartUpViewModel model, __) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: TweenAnimationBuilder(
                  tween: _scaleTween,
                  duration: Duration(
                    seconds: 1,
                  ),
                  onEnd: () {
                    model.isLoggedIn();
                  },
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: child,
                    );
                  },
                  child: Container(
                      color: Styles.appBackground,
                      alignment: Alignment.center,
                      child: Image.asset('images/logo.png', height: 2)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: CustomText(
                'Aviato',
                fontWeight: FontWeight.bold,
                color: Styles.colorWhite,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}

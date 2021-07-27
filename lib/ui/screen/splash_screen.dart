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

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Tween<double> _scaleTween = Tween<double>(begin: 0, end: 200);
  NavigationService navigate = locator<NavigationService>();

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween(begin: 1.0, end: -1.0).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

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
                      child: FadeTransition(
                         opacity: _animation,
                        child: Image.asset('images/logo.png', height: 2))),
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

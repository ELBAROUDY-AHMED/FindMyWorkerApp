import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Onboarding_Screens/onbording.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: AnimatedSplashScreen(
            splashIconSize: 500,
            // curve: Curve.easeInCirc,
            backgroundColor: Colors.white,
            //Color(0xff4377ec),
            //const Color(0xff4377ec),(old color)
            // pageTransitionType: PageTransitionsType,
            splashTransition: SplashTransition.sizeTransition,
            splash: "assets/images/final_logo.png",
            nextScreen: OnboardingScreen()
        ),
      ),
    );
  }
}

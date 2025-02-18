import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/features/onboarding/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String routeName = "splash";
  static Duration _duration = Duration(
    seconds: 2,
  );

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, OnboardingPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AppAssets.splashBg,
              ))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: FadeInDown(
                    duration: SplashPage._duration,
                    child: Image.asset(
                      AppAssets.splashGlow,
                      height: size.height * 0.25,
                    ))),
            Align(
                alignment: Alignment.center,
                child: ZoomIn(
                    duration: SplashPage._duration,
                    child: Image.asset(
                      AppAssets.splashLogo,
                      height: size.height * 0.30,
                    ))),
            Align(
                alignment: Alignment.bottomCenter,
                child: FadeInUp(
                    duration: SplashPage._duration,
                    child: Image.asset(
                      AppAssets.splashBrand,
                      height: size.height * 0.25,
                    ))),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.25),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: FadeInLeft(
                      child: Image.asset(
                    AppAssets.splashLeftShape,
                    width: size.width * 0.25,
                  ))),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: FadeInRight(
                      duration: SplashPage._duration,
                      child: Image.asset(
                        AppAssets.splashRightShape,
                        width: size.width * 0.25,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}

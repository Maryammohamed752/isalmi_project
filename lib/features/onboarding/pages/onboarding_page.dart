import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/features/layout/pages/layout_page.dart';

class OnboardingPage extends StatelessWidget {
  static String routeName = "on_boarding";

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size= MediaQuery.of(context).size;
    TextStyle bodyStyle = GoogleFonts.elMessiri(
        fontSize: 16.0, color: Color(0xffE2BE7E), fontWeight: FontWeight.bold);

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xffE2BE7E)),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0x99202020),
      imageFlex: 4,
      imagePadding: EdgeInsets.zero,
    );
    Widget _buildImage(String assetName, [double width = 250]) {
      return Image.asset('assets/images/$assetName', width: width);
    }

    return IntroductionScreen(
      globalHeader: Image.asset(
        AppAssets.logo,
        width: 100,
        height: 100,
      ),
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
          color: Color(
            0XFFE2BE7E,
          ),
          activeColor: Color(0XFFE2BE7E)),
      globalBackgroundColor: Color(0x99202020),
      showDoneButton: true,
      onDone: () {
        Navigator.pushReplacementNamed(context, LayoutPage.routeName);
      },
      done: const Text(
        "Finish",
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2BE7E)),
      ),
      showNextButton: true,
      next: Text(
        "Next",
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2BE7E)),
      ),
      showBackButton: true,
      back: Text("Back",
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffE2BE7E))),
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",
          image: _buildImage(
            'welcome.png',
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage('welcome_1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage('welcome_quran.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage('welcome_bearish.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage('welcome_radio.png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}

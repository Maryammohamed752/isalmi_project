import 'package:flutter/material.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/theme/app_colors.dart';

class SbhaTab extends StatefulWidget {
  const SbhaTab({super.key});

  @override
  State<SbhaTab> createState() => _SbhaTabState();
}

class _SbhaTabState extends State<SbhaTab> {
  List<String> tasbeeh = ["سبحان الله", "الحمد الله", "الله أكبر"];

  double rotationAngle = 0;
  int counter = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppAssets.sbhaBg))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.logo,
              height: size.height * .20,
            ),
            Text(
                textAlign: TextAlign.center,
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 26,
                    fontFamily: "Janna")),
            Expanded(
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                        top: size.height * .08,
                        left: size.width * 0.30,
                        child: Image.asset(AppAssets.sebhaHead)),
                    InkWell(
                      onTap: () {
                        handleTasbeeh();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 85),
                        child: AnimatedRotation(
                          turns: rotationAngle / 360,
                          duration: Duration(milliseconds: 500),
                          child: Image.asset(
                            AppAssets.sebhaBody,
                            height: size.height * 0.5,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * .30,
                      left: size.width * .195,
                      child: Column(
                        children: [
                          Text(
                            tasbeeh[index],
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 23,
                                fontFamily: "Janna"),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Text(
                            "$counter",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 23,
                                fontFamily: "Janna"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  handleTasbeeh() {
    setState(() {
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % tasbeeh.length;
      } else {
        counter++;
      }
      rotationAngle += 10;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/theme/app_colors.dart';

class TimesTab extends StatefulWidget {
  const TimesTab({super.key});

  @override
  State<TimesTab> createState() => _TimesTabState();
}

class _TimesTabState extends State<TimesTab> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppAssets.timeBg)),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.asset(
            AppAssets.logo,
            height: size.height * .20,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/container.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Image.asset("assets/images/time_card.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '16 jul,',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.whiteColor),
                          ),
                          Text(
                            '2024',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Pray Times',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0XFF202020),
                              ),
                            ),
                            Text(
                              'Thursday',
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff202020)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '09 muh,',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.whiteColor),
                            ),
                            Text(
                              '1946',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ]));

    //Container(
  }
}

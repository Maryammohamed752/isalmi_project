import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_islami/Api/api_manager.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/constants/date_utils.dart';
import 'package:project_islami/core/theme/app_colors.dart';
import 'package:project_islami/features/layout/time/counter_down_time.dart';
import 'package:project_islami/models/azkar_model.dart';

class TimesTab extends StatefulWidget {
  const TimesTab({super.key});

  @override
  State<TimesTab> createState() => _TimesTabState();
}

class _TimesTabState extends State<TimesTab> {
  final AudioPlayer audioPlayer = AudioPlayer();


  void playAzan() {
    audioPlayer.play(UrlSource("https://cdn.aladhan.com/audio/adhans/a4.mp3"));
  }

  void stopAzan() {
    audioPlayer.stop();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppAssets.timeBg))),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.logo,
                height: size.height * .20,
              ),
              SizedBox(
                  width: double.infinity,
                  height: size.height * .40,
                  child: FutureBuilder(
                    future: ApiManager.getPrayingData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Column(
                          children: [
                            Text("Something Went Wrong"),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ApiManager.getPrayingData();
                                  });
                                },
                                child: Text("Try Again"))
                          ],
                        );
                      }
                      AzkarModel data = snapshot.data!;
                      Map<String, dynamic> prayerTimes =
                      PrayerTime.sortPrayerTimes(
                          data.data!.timings!.toJson());

                      Map<String, Duration> prayerCountDown =
                      PrayerTime.getNextPrayerCountDown(
                          data.data!.timings!.toJson());

                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: AppColors.brownColor,
                            image: DecorationImage(
                              image: AssetImage("assets/images/time_card.png"),
                              fit: BoxFit.fill,
                            )),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                                top: 10,
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      DateFormatter.formatGregorian(
                                          data.data!.date!.gregorian!),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Column(
                                      children: [
                                        AutoSizeText(
                                          "Pray Time",
                                          style: TextStyle(
                                              color: AppColors.brownColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        AutoSizeText(
                                          data.data!.date!.gregorian!.weekday!
                                              .en!,
                                          style: TextStyle(
                                              color: AppColors.brownColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                    AutoSizeText(
                                      DateFormatter.formatHijri(
                                          data.data!.date!.hijri!),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                )),
                            CarouselSlider.builder(
                                itemCount: prayerTimes.length,
                                itemBuilder: (context, index, realIndex) {
                                  return buildPrayItem(
                                      size,
                                      prayerTimes.keys.elementAt(index),
                                      prayerTimes.values.elementAt(index));
                                },
                                options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.25,
                                    enlargeFactor: 0.15,
                                    height: size.height * 0.22)),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CounterDownTime(
                                playAzan: playAzan,
                                stopAzan: stopAzan,
                                getPrayingData: () {
                                  setState(() {
                                    ApiManager.getPrayingData();
                                  });
                                },
                                timeRemaining: // Duration(seconds: 5))),
                                prayerCountDown[prayerTimes.keys.first]!,),)
                          ],
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Container buildPrayItem(Size size, String prayName, String prayTime) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff202020), AppColors.gradientColor])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AutoSizeText(
            prayName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor),
          ),
          AutoSizeText(
            TimeConverter.to12Hour(prayTime),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}

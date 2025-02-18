import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/features/layout/pages/hadith/widgets/hadith_item_card.dart';
import 'package:project_islami/models/hadith_data.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (hadithDataList.isEmpty) loadHadithData();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppAssets.hadithBg))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.hadithLogo,
            height: size.height * 0.1,
          ),
          Expanded(
            child: CarouselSlider(
                items: hadithDataList.map(
                  (e) {
                    return HadithItemCard(hadithData: e);
                  },
                ).toList(),
                options: CarouselOptions(
                  //height: 400,
                  aspectRatio: 0.7,
                  viewportFraction: 0.68,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  scrollDirection: Axis.horizontal,
                )),
          )
        ],
      ),
    );
  }

  loadHadithData() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadithList = content.split("#");
    for (var element in allHadithList) {
      var singleHadith = element.trim();
      int index = singleHadith.indexOf("\n");
      String hadithTitle = singleHadith.substring(0, index);
      String hadithContent = singleHadith.substring(index + 1);
      var hadithData =
          HadithData(hadithContent: hadithContent, hadithTitle: hadithTitle);
      hadithDataList.add(hadithData);
      print(hadithTitle);
      setState(() {});
    }
  }
}

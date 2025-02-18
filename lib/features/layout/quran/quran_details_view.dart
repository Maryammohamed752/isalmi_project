import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/theme/app_colors.dart';
import 'package:project_islami/models/sura_data_model.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "QuranDetailsView";

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDataModel;
    if (versesList.isEmpty) loadData(args.id.toString());
    loadData(args.id.toString());
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.suraDetailsScreen),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          title: Text(args.nameEn,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: "Janna",
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 40),
              child: Text(
                args.nameAr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontFamily: "Janna",
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => Text(
                    "[${index + 1}]${versesList[index]} ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: "Janna",
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                itemCount: versesList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadData(String suraID) async {
    String content = await rootBundle.loadString("assets/files/$suraID.txt");
    setState(() {
      versesList = content.split("\n");
    });
  }
}

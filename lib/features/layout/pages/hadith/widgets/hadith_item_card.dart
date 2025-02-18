import 'package:flutter/material.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/theme/app_colors.dart';

import '../../../../../models/hadith_data.dart';

class HadithItemCard extends StatelessWidget {
  final HadithData hadithData;

  const HadithItemCard({super.key, required this.hadithData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithCard),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            hadithData.hadithTitle,
            style: TextStyle(
                fontFamily: "Janna",
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.secondaryColor),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  hadithData.hadithContent,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.secondaryColor),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

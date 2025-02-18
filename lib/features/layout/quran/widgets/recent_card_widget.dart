import 'package:flutter/material.dart';
import 'package:project_islami/core/theme/app_colors.dart';
import 'package:project_islami/models/sura_data_model.dart';

class RecentCardWidget extends StatelessWidget {
  final SuraDataModel suraDataModel;

  const RecentCardWidget({
    super.key,
    required this.suraDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: EdgeInsets.all(10),
      //height: 150,
      //width: 285,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                suraDataModel.nameEn,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                suraDataModel.nameAr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                " ${suraDataModel.verses}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Image.asset("assets/images/most_recently.png"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_islami/core/theme/app_colors.dart';

import '../../../../models/sura_data_model.dart';

class SuraCardWidget extends StatelessWidget {
  final SuraDataModel suraDataModel;

  const SuraCardWidget({
    super.key,
    required this.suraDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/recent_icn.png"))),
            child: Text(
              suraDataModel.id.toString(),
              style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraDataModel.nameEn,
                style: TextStyle(
                    fontFamily: "Janna",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "${suraDataModel.verses} verses",
                style: TextStyle(
                    fontFamily: "Janna",
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor),
              )
            ],
          ),
          Spacer(),
          Text(
            suraDataModel.nameAr,
            style: TextStyle(
                fontFamily: "Janna",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor),
          )
        ],
      ),
    );
  }
}

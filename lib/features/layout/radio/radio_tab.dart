import 'package:flutter/material.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/theme/app_colors.dart';
import 'package:project_islami/features/layout/radio/widgets/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage(AppAssets.radioBg)),
      ),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.blackColor,
                ),
                child: TabBar(
                  labelStyle: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Janna"),
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelStyle: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Janna"),
                  indicator: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  tabs: [
                    Tab(
                      text: "Radio",
                    ),
                    Tab(
                      text: "Reciters",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return RadioItem();
                    },
                    itemCount: 20,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return RadioItem();
                    },
                    itemCount: 20,
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_islami/Api/api_manager.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/theme/app_colors.dart';
import 'package:project_islami/features/layout/radio/widgets/radio_item.dart';
import 'package:project_islami/features/layout/radio/widgets/reciter_item.dart';
import 'package:project_islami/models/radio_response_model.dart';
import 'package:project_islami/models/reciters_response_model.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;
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
              selectedIndex == 0
                  ? FutureBuilder<RadioResponseModel>(
                      future: ApiManager.getRadioData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.white60,
                          ));
                        } else if (snapshot.hasError) {
                          return Column(
                            children: [
                              Text('Something went wrong'),
                              ElevatedButton(
                                  onPressed: () {
                                    ApiManager.getRadioData();
                                    setState(() {});
                                  },
                                  child: Text("Try Again"))
                            ],
                          );
                        }
                        RadioResponseModel data = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return RadioItem(model: data.radios![index]);
                            },
                            itemCount: data.radios!.length,
                          ),
                        );
                      })
                  : FutureBuilder<RecitersResponseModel>(
                      future: ApiManager.getRecitersData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.white60,
                          ));
                        } else if (snapshot.hasError) {
                          return Column(
                            children: [
                              Text('Something went wrong'),
                              ElevatedButton(
                                  onPressed: () {
                                    ApiManager.getRadioData();
                                    setState(() {});
                                  },
                                  child: Text("Try Again"))
                            ],
                          );
                        }
                        RecitersResponseModel data = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return ReciterItem(model: data.reciters![index]);
                            },
                            itemCount: data.reciters!.length,
                          ),
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}

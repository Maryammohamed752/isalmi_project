import 'package:flutter/material.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/theme/app_colors.dart';
import 'package:project_islami/features/layout/pages/hadith/hadith_tab.dart';
import 'package:project_islami/features/layout/quran/quran_tab.dart';
import 'package:project_islami/features/layout/radio/radio_tab.dart';
import 'package:project_islami/features/layout/tasbeeh/sbha_tab.dart';
import 'package:project_islami/features/layout/time/times_tab.dart';
import 'package:project_islami/features/layout/widgets/custom_nav_bar_item.dart';

class LayoutPage extends StatefulWidget {
  static String routeName = "/layout";

  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SbhaTab(),
    RadioTab(),
    TimesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                iconPath: AppAssets.quranIcn,
                navBarItem: 0,
              ),
              label: "Quran",
            ),
            BottomNavigationBarItem(
                icon: CustomNavBarItem(
                    selectedIndex: selectedIndex,
                    iconPath: AppAssets.hadithIcn,
                    navBarItem: 1),
                label: "Hadith"),
            BottomNavigationBarItem(
                icon: CustomNavBarItem(
                  selectedIndex: selectedIndex,
                  iconPath: AppAssets.sebhaIcn,
                  navBarItem: 2,
                ),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: CustomNavBarItem(
                  selectedIndex: selectedIndex,
                  iconPath: AppAssets.radioIcn,
                  navBarItem: 3,
                ),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: CustomNavBarItem(
                  selectedIndex: selectedIndex,
                  iconPath: AppAssets.timesIcn,
                  navBarItem: 4,
                ),
                label: "Time"),
          ]),
      body: tabs[selectedIndex],
    );
  }
}

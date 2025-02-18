import 'package:flutter/material.dart';
import 'package:project_islami/core/constants/app_assets.dart';
import 'package:project_islami/core/constants/local_storage_keys.dart';
import 'package:project_islami/core/services/local_storage_service.dart';
import 'package:project_islami/core/theme/app_colors.dart';
import 'package:project_islami/features/layout/quran/quran_details_view.dart';
import 'package:project_islami/features/layout/quran/widgets/recent_card_widget.dart';
import 'package:project_islami/features/layout/quran/widgets/sura_card_widget.dart';

import '../../../models/sura_data_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({
    super.key,
  });

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    super.initState();
    _loadRecentSura();
  }

  String searchQuery = '';

  List<SuraDataModel> recentSuraModels = [];

  List<String> recentSuraIndexs = [];
  List<SuraDataModel> searchSuraModels = [];

  List<SuraDataModel> suraList = [
    SuraDataModel(id: 1, nameAr: "الفاتحة", nameEn: "Al-Fatiha", verses: 7),
    SuraDataModel(id: 2, nameAr: "البقرة", nameEn: "Al-Baqarah", verses: 286),
    SuraDataModel(
        id: 3, nameAr: "آل عمران", nameEn: "Aal-E-Imran", verses: 200),
    SuraDataModel(id: 4, nameAr: "النساء", nameEn: "An-Nisa'", verses: 176),
    SuraDataModel(id: 5, nameAr: "المائدة", nameEn: "Al-Ma'idah", verses: 120),
    SuraDataModel(id: 6, nameAr: "الأنعام", nameEn: "Al-An'am", verses: 165),
    SuraDataModel(id: 7, nameAr: "الأعراف", nameEn: "Al-A'raf", verses: 206),
    SuraDataModel(id: 8, nameAr: "الأنفال", nameEn: "Al-Anfal", verses: 75),
    SuraDataModel(id: 9, nameAr: "التوبة", nameEn: "At-Tawbah", verses: 129),
    SuraDataModel(id: 10, nameAr: "يونس", nameEn: "Yunus", verses: 109),
    SuraDataModel(id: 11, nameAr: "هود", nameEn: "Hud", verses: 123),
    SuraDataModel(id: 12, nameAr: "يوسف", nameEn: "Yusuf", verses: 111),
    SuraDataModel(id: 13, nameAr: "الرعد", nameEn: "Ar-Ra'd", verses: 43),
    SuraDataModel(id: 14, nameAr: "إبراهيم", nameEn: "Ibrahim", verses: 52),
    SuraDataModel(id: 15, nameAr: "الحجر", nameEn: "Al-Hijr", verses: 99),
    SuraDataModel(id: 16, nameAr: "النحل", nameEn: "An-Nahl", verses: 128),
    SuraDataModel(id: 17, nameAr: "الإسراء", nameEn: "Al-Isra", verses: 111),
    SuraDataModel(id: 18, nameAr: "الكهف", nameEn: "Al-Kahf", verses: 110),
    SuraDataModel(id: 19, nameAr: "مريم", nameEn: "Maryam", verses: 98),
    SuraDataModel(id: 20, nameAr: "طه", nameEn: "Ta-Ha", verses: 135),
    SuraDataModel(id: 21, nameAr: "الأنبياء", nameEn: "Al-Anbiya", verses: 112),
    SuraDataModel(id: 22, nameAr: "الحج", nameEn: "Al-Hajj", verses: 78),
    SuraDataModel(
        id: 23, nameAr: "المؤمنون", nameEn: "Al-Mu'minun", verses: 118),
    SuraDataModel(id: 24, nameAr: "النور", nameEn: "An-Nur", verses: 64),
    SuraDataModel(id: 25, nameAr: "الفرقان", nameEn: "Al-Furqan", verses: 77),
    SuraDataModel(
        id: 26, nameAr: "الشعراء", nameEn: "Ash-Shu'ara", verses: 227),
    SuraDataModel(id: 27, nameAr: "النمل", nameEn: "An-Naml", verses: 93),
    SuraDataModel(id: 28, nameAr: "القصص", nameEn: "Al-Qasas", verses: 88),
    SuraDataModel(id: 29, nameAr: "العنكبوت", nameEn: "Al-Ankabut", verses: 69),
    SuraDataModel(id: 30, nameAr: "الروم", nameEn: "Ar-Rum", verses: 60),
    SuraDataModel(id: 31, nameAr: "لقمان", nameEn: "Luqman", verses: 34),
    SuraDataModel(id: 32, nameAr: "السجدة", nameEn: "As-Sajda", verses: 30),
    SuraDataModel(id: 33, nameAr: "الأحزاب", nameEn: "Al-Ahzab", verses: 73),
    SuraDataModel(id: 34, nameAr: "سبأ", nameEn: "Saba", verses: 54),
    SuraDataModel(id: 35, nameAr: "فاطر", nameEn: "Fatir", verses: 45),
    SuraDataModel(id: 36, nameAr: "يس", nameEn: "Ya-Sin", verses: 83),
    SuraDataModel(id: 37, nameAr: "الصافات", nameEn: "As-Saffat", verses: 182),
    SuraDataModel(id: 38, nameAr: "ص", nameEn: "Sad", verses: 88),
    SuraDataModel(id: 39, nameAr: "الزمر", nameEn: "Az-Zumar", verses: 75),
    SuraDataModel(id: 40, nameAr: "غافر", nameEn: "Ghafir", verses: 85),
    SuraDataModel(id: 41, nameAr: "فصلت", nameEn: "Fussilat", verses: 54),
    SuraDataModel(id: 42, nameAr: "الشورى", nameEn: "Ash-Shura", verses: 53),
    SuraDataModel(id: 43, nameAr: "الزخرف", nameEn: "Az-Zukhruf", verses: 89),
    SuraDataModel(id: 44, nameAr: "الدخان", nameEn: "Ad-Dukhan", verses: 59),
    SuraDataModel(id: 45, nameAr: "الجاثية", nameEn: "Al-Jathiya", verses: 37),
    SuraDataModel(id: 46, nameAr: "الأحقاف", nameEn: "Al-Ahqaf", verses: 35),
    SuraDataModel(id: 47, nameAr: "محمد", nameEn: "Muhammad", verses: 38),
    SuraDataModel(id: 48, nameAr: "الفتح", nameEn: "Al-Fath", verses: 29),
    SuraDataModel(id: 49, nameAr: "الحجرات", nameEn: "Al-Hujurat", verses: 18),
    SuraDataModel(id: 50, nameAr: "ق", nameEn: "Qaf", verses: 45),
    SuraDataModel(
        id: 51, nameAr: "الذاريات", nameEn: "Adh-Dhariyat", verses: 60),
    SuraDataModel(id: 52, nameAr: "الطور", nameEn: "At-Tur", verses: 49),
    SuraDataModel(id: 53, nameAr: "النجم", nameEn: "An-Najm", verses: 62),
    SuraDataModel(id: 54, nameAr: "القمر", nameEn: "Al-Qamar", verses: 55),
    SuraDataModel(id: 55, nameAr: "الرحمن", nameEn: "Ar-Rahman", verses: 78),
    SuraDataModel(id: 56, nameAr: "الواقعة", nameEn: "Al-Waqi'a", verses: 96),
    SuraDataModel(id: 57, nameAr: "الحديد", nameEn: "Al-Hadid", verses: 29),
    SuraDataModel(
        id: 58, nameAr: "المجادلة", nameEn: "Al-Mujadila", verses: 22),
    SuraDataModel(id: 59, nameAr: "الحشر", nameEn: "Al-Hashr", verses: 24),
    SuraDataModel(
        id: 60, nameAr: "الممتحنة", nameEn: "Al-Mumtahina", verses: 13),
    SuraDataModel(id: 61, nameAr: "الصف", nameEn: "As-Saff", verses: 14),
    SuraDataModel(id: 62, nameAr: "الجمعة", nameEn: "Al-Jumu'a", verses: 11),
    SuraDataModel(
        id: 63, nameAr: "المنافقون", nameEn: "Al-Munafiqun", verses: 11),
    SuraDataModel(id: 64, nameAr: "التغابن", nameEn: "At-Taghabun", verses: 18),
    SuraDataModel(id: 65, nameAr: "الطلاق", nameEn: "At-Talaq", verses: 12),
    SuraDataModel(id: 66, nameAr: "التحريم", nameEn: "At-Tahrim", verses: 12),
    SuraDataModel(id: 67, nameAr: "الملك", nameEn: "Al-Mulk", verses: 30),
    SuraDataModel(id: 68, nameAr: "القلم", nameEn: "Al-Qalam", verses: 52),
    SuraDataModel(id: 69, nameAr: "الحاقة", nameEn: "Al-Haqqah", verses: 52),
    SuraDataModel(id: 70, nameAr: "المعارج", nameEn: "Al-Ma'arij", verses: 44),
    SuraDataModel(id: 71, nameAr: "نوح", nameEn: "Nuh", verses: 28),
    SuraDataModel(id: 72, nameAr: "الجن", nameEn: "Al-Jinn", verses: 28),
    SuraDataModel(id: 73, nameAr: "المزمل", nameEn: "Al-Muzzammil", verses: 20),
    SuraDataModel(id: 74, nameAr: "المدثر", nameEn: "Al-Muddathir", verses: 56),
    SuraDataModel(id: 75, nameAr: "القيامة", nameEn: "Al-Qiyamah", verses: 40),
    SuraDataModel(id: 76, nameAr: "الإنسان", nameEn: "Al-Insan", verses: 31),
    SuraDataModel(
        id: 77, nameAr: "المرسلات", nameEn: "Al-Mursalat", verses: 50),
    SuraDataModel(id: 78, nameAr: "النبأ", nameEn: "An-Naba'", verses: 40),
    SuraDataModel(id: 79, nameAr: "النازعات", nameEn: "An-Nazi'at", verses: 46),
    SuraDataModel(id: 80, nameAr: "عبس", nameEn: "Abasa", verses: 42),
    SuraDataModel(id: 81, nameAr: "التكوير", nameEn: "At-Takwir", verses: 29),
    SuraDataModel(id: 82, nameAr: "الإنفطار", nameEn: "Al-Infitar", verses: 19),
    SuraDataModel(
        id: 83, nameAr: "المطففين", nameEn: "Al-Mutaffifin", verses: 36),
    SuraDataModel(
        id: 84, nameAr: "الإنشقاق", nameEn: "Al-Inshiqaq", verses: 25),
    SuraDataModel(id: 85, nameAr: "البروج", nameEn: "Al-Buruj", verses: 22),
    SuraDataModel(id: 86, nameAr: "الطارق", nameEn: "At-Tariq", verses: 17),
    SuraDataModel(id: 87, nameAr: "الأعلى", nameEn: "Al-A'la", verses: 19),
    SuraDataModel(id: 88, nameAr: "الغاشية", nameEn: "Al-Ghashiya", verses: 26),
    SuraDataModel(id: 89, nameAr: "الفجر", nameEn: "Al-Fajr", verses: 30),
    SuraDataModel(id: 90, nameAr: "البلد", nameEn: "Al-Balad", verses: 20),
    SuraDataModel(id: 91, nameAr: "الشمس", nameEn: "Ash-Shams", verses: 15),
    SuraDataModel(id: 92, nameAr: "الليل", nameEn: "Al-Lail", verses: 21),
    SuraDataModel(id: 93, nameAr: "الضحى", nameEn: "Ad-Duhaa", verses: 11),
    SuraDataModel(id: 94, nameAr: "الشرح", nameEn: "Ash-Sharh", verses: 8),
    SuraDataModel(id: 95, nameAr: "التين", nameEn: "At-Tin", verses: 8),
    SuraDataModel(id: 96, nameAr: "العلق", nameEn: "Al-Alaq", verses: 19),
    SuraDataModel(id: 97, nameAr: "القدر", nameEn: "Al-Qadr", verses: 5),
    SuraDataModel(id: 98, nameAr: "البينة", nameEn: "Al-Bayyina", verses: 8),
    SuraDataModel(id: 99, nameAr: "الزلزلة", nameEn: "Az-Zalzala", verses: 8),
    SuraDataModel(id: 100, nameAr: "العاديات", nameEn: "Al-Adiyat", verses: 11),
    SuraDataModel(id: 101, nameAr: "القارعة", nameEn: "Al-Qari'a", verses: 11),
    SuraDataModel(id: 102, nameAr: "التكاثر", nameEn: "At-Takathur", verses: 8),
    SuraDataModel(id: 103, nameAr: "العصر", nameEn: "Al-Asr", verses: 3),
    SuraDataModel(id: 104, nameAr: "الهمزة", nameEn: "Al-Humaza", verses: 9),
    SuraDataModel(id: 105, nameAr: "الفيل", nameEn: "Al-Fil", verses: 5),
    SuraDataModel(id: 106, nameAr: "قريش", nameEn: "Quraysh", verses: 4),
    SuraDataModel(id: 107, nameAr: "الماعون", nameEn: "Al-Ma'un", verses: 7),
    SuraDataModel(id: 108, nameAr: "الكوثر", nameEn: "Al-Kawthar", verses: 3),
    SuraDataModel(
        id: 109, nameAr: "الكافرون", nameEn: "Al-Kafiroon", verses: 6),
    SuraDataModel(id: 110, nameAr: "النصر", nameEn: "An-Nasr", verses: 3),
    SuraDataModel(id: 111, nameAr: "المسد", nameEn: "Al-Masad", verses: 5),
    SuraDataModel(id: 112, nameAr: "الإخلاص", nameEn: "Al-Ikhlas", verses: 4),
    SuraDataModel(id: 113, nameAr: "الفلق", nameEn: "Al-Falaq", verses: 5),
    SuraDataModel(id: 114, nameAr: "الناس", nameEn: "An-Nas", verses: 6),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppAssets.quranBg))),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: size.height * 0.15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  cursorColor: AppColors.primaryColor,
                  onChanged: (String value) {
                    searchQuery = value;
                    search();
                    setState(() {});
                  },
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleTextColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondaryColor.withOpacity(0.5),
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.titleTextColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage("assets/images/prefix_icon.png"),
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: searchQuery.isEmpty,
                replacement: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => _onSuraTab(searchSuraModels[index].id - 1),
                    child: SuraCardWidget(
                      suraDataModel: searchSuraModels[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    endIndent: 60,
                    indent: 60,
                    thickness: 2,
                  ),
                  itemCount: searchSuraModels.length,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: Text(
                        "Most Recently",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.titleTextColor),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: Visibility(
                        visible: recentSuraModels.isNotEmpty,
                        replacement: Center(
                          child: Text(
                            "No Recent Sura",
                            style: TextStyle(
                                fontFamily: "Janna",
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, QuranDetailsView.routeName,
                                  arguments: recentSuraModels[index]);
                            },
                            child: RecentCardWidget(
                              suraDataModel: recentSuraModels[index],
                            ),
                          ),
                          separatorBuilder: (context, int index) => SizedBox(
                            width: 16,
                          ),
                          itemCount: recentSuraModels.length,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: Text(
                        "Sura List",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.titleTextColor),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _onSuraTab(suraList[index].id - 1),
                        child: SuraCardWidget(
                          suraDataModel: suraList[index],
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        endIndent: 60,
                        indent: 60,
                      ),
                      itemCount: suraList.length,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onSuraTab(int index) {
    _cacheSura(index);

    Navigator.pushNamed(
      context,
      QuranDetailsView.routeName,
      arguments: suraList[index],
    );
  }

  _cacheSura(int index) async {
    String indexString = index.toString();
    if (recentSuraIndexs.contains(indexString)) return;
    if (recentSuraIndexs.length == 5) {
      recentSuraIndexs.removeLast();
    }
    recentSuraIndexs.insert(0, indexString);
    //recentSuraIndexList.add(indexString);
    await LocalStorageServices.setList(
      LocalStorageKeys.recentSuras,
      recentSuraIndexs,
    );
    _loadRecentSura();
    setState(() {});
  }

  _loadRecentSura() {
    //LocalStorageServices.remove(LocalStorageKeys.recentSuras);
    recentSuraIndexs = [];
    recentSuraModels = [];
    recentSuraIndexs =
        LocalStorageServices.getStringList(LocalStorageKeys.recentSuras) ?? [];
    for (String index in recentSuraIndexs) {
      int intIndex = int.parse(index);
      recentSuraModels.add(suraList[intIndex]);
    }
  }

  void search() {
    searchSuraModels = [];
    for (SuraDataModel sura in suraList) {
      if (sura.nameAr.toLowerCase().contains(searchQuery.toLowerCase()) ||
          sura.nameEn.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchSuraModels.add(sura);
      }
    }
  }
}

//extension on String {
//get id => null;
//}

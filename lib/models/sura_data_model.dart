class SuraDataModel {
  int id;
  String nameAr;
  String nameEn;
  int verses;

  SuraDataModel(
      {required this.id,
      required this.nameAr,
      required this.nameEn,
      required this.verses});

  @override
  String toString() {
    return 'Sura(id: $id, nameAr: $nameAr, nameEn: $nameEn, verses: $verses)';
  }
}

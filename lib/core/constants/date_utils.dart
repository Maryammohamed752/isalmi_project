import 'package:intl/intl.dart';
import 'package:project_islami/models/azkar_model.dart';

class DateFormatter {
  static String formatGregorian(Gregorian date) {
    return '${date.day!} ${date.month!.en!.substring(0, 3)}\n ${date.year!}';
  }

  static String formatHijri(Hijri date) {
    return '${date.day!} ${date.month!.en!.substring(0, 3)}\n ${date.year!}';
  }
}

class TimeConverter {
  static String to12Hour(String time) {
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    return DateFormat("hh:mm\na").format(dateTime);
  }
}

class PrayerTime {
  static Map<String, dynamic> sortPrayerTimes(
      Map<String, dynamic> prayerTimes) {
    DateTime now = DateTime.now();

    List<MapEntry<String, dynamic>> sortedEntries = prayerTimes.entries.toList()
      ..sort((a, b) {
        DateTime timeA = DateFormat("HH:mm").parse(a.value);
        DateTime timeB = DateFormat("HH:mm").parse(b.value);

        DateTime dateTimeA =
            DateTime(now.year, now.month, now.day, timeA.hour, timeA.minute);
        DateTime dateTimeB =
            DateTime(now.year, now.month, now.day, timeB.hour, timeB.minute);

        if (dateTimeA.isBefore(now)) {
          dateTimeA.add(Duration(days: 1));
        }
        if (dateTimeB.isBefore(now)) {
          dateTimeB.add(Duration(days: 1));
        }
        return dateTimeA.compareTo(dateTimeB);
      });
    return Map<String, dynamic>.fromEntries(sortedEntries);
  }

  static Map<String, Duration> getNextPrayerCountDown(
      Map<String, dynamic> prayerTimes) {
    DateTime now = DateTime.now();
    Map<String, Duration> timeDifferences = {};
    prayerTimes.forEach((name, timeString) {
      DateTime prayerTime = DateFormat("HH:mm").parse(timeString);

      DateTime prayerDateTime = DateTime(
          now.year, now.month, now.day, prayerTime.hour, prayerTime.minute);
      if (prayerTime.isBefore(now)) {
        prayerTime.add(Duration(days: 1));
      }
      Duration difference = prayerDateTime.difference(now);
      timeDifferences[name] = difference;
    });
    return timeDifferences;
  }
}

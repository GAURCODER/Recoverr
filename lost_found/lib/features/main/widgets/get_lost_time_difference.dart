import 'package:intl/intl.dart';

Map<String, int> getLostTimeDifference(
  String? lostDate,
  String? lostTime,
  DateTime updatedAt,
) {
  String currentTime = DateFormat('yyyyMMdd').format(DateTime.now());

  if (lostDate == null ||
      lostTime == null ||
      lostDate.isEmpty ||
      lostTime.isEmpty) {
    return {
      "": 0,
    };
  }

  int postedYear = int.parse(lostDate.substring(6));
  int currentYear = int.parse(currentTime.substring(0, 4));

  if (postedYear != currentYear) {
    if (currentYear - postedYear == 1) {
      return {
        '${currentYear - postedYear} year ago': 1,
      };
    } else {
      return {
        '${currentYear - postedYear} years ago': 2,
      };
    }
  }

  int postedMonth = int.parse(lostDate.substring(3, 5));
  int currentMonth = int.parse(currentTime.substring(4, 6));

  if (postedMonth != currentMonth) {
    if (currentMonth - postedMonth == 1) {
      return {
        '${currentMonth - postedMonth} month ago': 3,
      };
    } else {
      return {
        '${currentMonth - postedMonth} months ago': 4,
      };
    }
  }

  int postedDate = int.parse(lostDate.substring(0, 2));
  int currentDate = int.parse(currentTime.substring(6));

  if (currentDate - postedDate < 1) {
    currentTime = DateFormat('hh:mm').format(DateTime.now());

    int postedHour = 0;
    if (lostTime[1] == ':') {
      postedHour = int.parse(lostTime.substring(0, 1));
    } else {
      postedHour = int.parse(lostTime.substring(0, 2));
    }

    int currentHour = int.parse(currentTime.substring(0, 2));

    if (currentHour == postedHour) {
      int postedMin = 0;
      if (lostTime[1] == ':') {
        postedMin = int.parse(lostTime.substring(2, 4));
      } else {
        postedMin = int.parse(lostTime.substring(3, 5));
      }

      int currentMin = int.parse(currentTime.substring(3));

      if ((currentMin - postedMin).abs() == 1) {
        return {
          '${(currentMin - postedMin).abs()} min ago': 5,
        };
      } else {
        return {
          '${(currentMin - postedMin).abs()} mins ago': 6,
        };
      }
    } else {
      if ((currentHour - postedHour).abs() == 1) {
        return {
          '${(currentHour - postedHour).abs()} hour ago': 7,
        };
      } else {
        return {
          '${(currentHour - postedHour).abs()} hours ago': 8,
        };
      }
    }
  }

  if (currentDate - postedDate == 1) {
    return {'${currentDate - postedDate} day ago': 9};
  }

  return {'${currentDate - postedDate} days ago': 10};
}

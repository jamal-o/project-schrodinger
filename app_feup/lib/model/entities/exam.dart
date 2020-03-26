import 'package:logger/logger.dart';

var months = {
  'Janeiro': '01',
  'Fevereiro': '02',
  'Março': '03',
  'Abril': '04',
  'Maio': '05',
  'Junho': '06',
  'Julho': '07',
  'Agosto': '08',
  'Setembro': '09',
  'Outubro': '10',
  'Novembro': '11',
  'Dezembro': '12'
};

class Exam {
  String subject;
  String begin;
  String end;
  List<String> rooms;
  String day;
  String examType;
  String weekDay;
  String month;
  String year;
  DateTime date;

  Exam.secConstructor(String subject, String begin, String end, String rooms,
      String day, String examType, String weekDay, String month, String year) {
    this.subject = subject;
    this.begin = begin;
    this.end = end;
    this.rooms = rooms.split(',');
    this.day = day;
    this.examType = examType;
    this.weekDay = weekDay;
    this.month = month;
    this.year = year;

    final monthKey = months[this.month];
    this.date = DateTime.parse(year + '-' + monthKey + '-' + day);
  }

  Exam(String schedule, String subject, String rooms, String date,
      String examType, String weekDay) {
    this.subject = subject;
    this.date = DateTime.parse(date);
    final scheduling = schedule.split('-');
    final dateSepared = date.split('-');
    this.begin = scheduling[0];
    this.end = scheduling[1];
    this.rooms = rooms.split(',');
    this.year = dateSepared[0];
    this.day = dateSepared[2];
    this.examType = examType;
    this.weekDay = weekDay;

    this.month = months.keys
        .firstWhere((k) => months[k] == dateSepared[1], orElse: () => null);
  }

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'begin': begin,
      'end': end,
      'rooms': rooms.join(','),
      'day': day,
      'examType': examType,
      'weekDay': weekDay,
      'month': month,
      'year': year
    };
  }

  void printExam() {
    Logger().i(
        '''$subject - $year - $month - $day -  $begin-$end - $examType - $rooms - $weekDay''');
  }

  @override
  String toString() {
    return '''$subject - $year - $month - $day -  $begin-$end - $examType - $rooms - $weekDay''';
  }
}
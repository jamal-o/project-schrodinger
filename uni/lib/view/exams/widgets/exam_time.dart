import 'package:flutter/material.dart';

class ExamTime extends StatelessWidget {
  final String begin;
  final String end;

  const ExamTime({Key? key, required this.begin, required this.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(begin, style: Theme.of(context).textTheme.bodyText2),
        Text(end, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}

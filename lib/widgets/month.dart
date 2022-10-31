import 'package:flutter/material.dart';

class Month extends StatelessWidget {
  final int month;
  final int year;

  Month({
    required this.month,
    required this.year,
    super.key,
  });

  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${months[month - 1]} $year',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

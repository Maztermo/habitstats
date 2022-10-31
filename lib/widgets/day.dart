import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  final DateTime date;
  final bool isToday;

  const Day({
    required this.date,
    required this.isToday,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return (isToday)
        ? Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                date.day.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        : Center(
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.grey[700]!, fontSize: 18),
            ),
          );
  }
}

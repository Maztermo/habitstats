import 'package:flutter/material.dart';

class ValidOrNotContainer extends StatelessWidget {
  const ValidOrNotContainer({
    Key? key,
    required this.title,
    required this.isValid,
    required this.widget,
  }) : super(key: key);

  final String title;
  final bool isValid;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280, maxHeight: 140),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: isValid ? Colors.green[200] : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [Text(title), widget],
      ),
    );
  }
}

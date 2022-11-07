import 'package:flutter/material.dart';

class FlatActionButton extends StatelessWidget {
  const FlatActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: onTap != null ? Colors.blue : Colors.grey[600]!.withAlpha(150),
      onPressed: onTap,
      child: const Icon(Icons.add),
    );
  }
}

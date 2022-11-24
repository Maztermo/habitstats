import 'package:flutter/material.dart';

class FlatActionButton extends StatelessWidget {
  const FlatActionButton({
    Key? key,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  final VoidCallback? onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: onTap == null ? Colors.grey[600]!.withAlpha(150) : null,
      onPressed: onTap,
      child: Icon(
        iconData,
        color: onTap == null ? Colors.grey[900]!.withAlpha(150) : null,
      ),
    );
  }
}

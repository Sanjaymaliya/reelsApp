import 'package:flutter/material.dart';
import 'package:reelsapps/extensions/app_extensions.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;

  final String label;

  final Color color;

  final VoidCallback? onTap;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 34),
          addVerticalSpace(5),
          Text(label),
        ],
      ),
    );
  }
}

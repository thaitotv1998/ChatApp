import 'package:flutter/material.dart';
import '../theme.dart';

class ActionIcon extends StatelessWidget {
  const ActionIcon({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            color: AppColors.cardLight,
            size: 29,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

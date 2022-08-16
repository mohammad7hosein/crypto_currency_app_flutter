import 'package:flutter/material.dart';

import '../../constants/my_theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const ProfileMenuItem({
    required this.text,
    required this.icon,
    required this.color,
    Key? key, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: greyColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

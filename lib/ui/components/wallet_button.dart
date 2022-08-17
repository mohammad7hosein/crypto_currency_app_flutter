import 'package:flutter/material.dart';

class WalletButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const WalletButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: theme.secondaryHeaderColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: theme.textTheme.bodyMedium,
        )
      ],
    );
  }
}

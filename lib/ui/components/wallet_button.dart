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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
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
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}

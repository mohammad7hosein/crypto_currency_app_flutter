import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;

  const CircularIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}

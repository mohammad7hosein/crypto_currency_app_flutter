import 'package:flutter/material.dart';

class FilterBox extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData icon;
  final String text;
  final Color color;
  final bool isSelected;

  const FilterBox({
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.color,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 120,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              isSelected ? theme.secondaryHeaderColor : theme.backgroundColor,
        ),
        child: AspectRatio(
          aspectRatio: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: color.withOpacity(0.2),
                ),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                text,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

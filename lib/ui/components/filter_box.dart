import 'package:cripto_currency_app_flutter/constants/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBox extends StatelessWidget {
  GestureTapCallback onPressed;
  IconData icon;
  String text;
  Color color;

  FilterBox({
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 60;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width / 3,
        height: 120,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: veryLight,
        ),
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
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCardDetails extends StatelessWidget {
  const ReusableCardDetails({
    super.key,
    required this.cardIcon,
    required this.iconText,
  });

  final IconData cardIcon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(cardIcon, size: 70.0),
        SizedBox(height: 15.0),
        Text(iconText, style: kAppTextStyle),
      ],
    );
  }
}

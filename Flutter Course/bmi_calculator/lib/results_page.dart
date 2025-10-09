import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'reusable_card_details.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text('Your Result', style: kResultsPageTitleTextStyle),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('NORMAL', style: kResultsTextStyle),
                  Text('20.0', style: kBMITextStyle),
                  Text(
                    'Your BMI result is quite low, you should eat more.',
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(((data['questionIndex'] as int) + 1).toString()),
            // Type casting is done above as the data eeds to be converted into a string from an integer
            Expanded(
              //Expanded forces the content within it to fit within the borders of the immediate parent i.e. Row or Column.
              child: Column(
                children: [
                  Text(data['question'] as String),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(data['chosenAnswer'] as String),
                  Text(data['correctAnswer'] as String),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}

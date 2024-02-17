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
            Text(((data['questions_index'] as int) + 1).toString()),
            // Type casting is done above as the data eeds to be converted into a string from an integer
          ],
        );
      }).toList(),
    );
  }
}

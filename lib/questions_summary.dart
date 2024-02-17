import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    Color buttonColor = Colors.white;
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            if (data['correctAnswer'] == data['chosenAnswer']) {
              buttonColor = const Color.fromARGB(255, 107, 134, 202);
            }
            if (data['correctAnswer'] != data['chosenAnswer']) {
              buttonColor = const Color.fromARGB(255, 222, 111, 150);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const CircleBorder(),
                    foregroundColor: Colors.black,
                    backgroundColor: buttonColor,
                  ),
                  child: Text(
                    ((data['questionIndex'] as int) + 1).toString(),
                  ),
                ),
                // Type casting is done above as the data eeds to be converted into a string from an integer
                Expanded(
                  //Expanded forces the content within it to fit within the borders of the immediate parent i.e. Row or Column.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data['chosenAnswer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 222, 111, 150),
                            fontSize: 15),
                      ),
                      Text(
                        data['correctAnswer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 107, 134, 202),
                            fontSize: 15),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 25),
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

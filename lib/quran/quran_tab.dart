import 'package:flutter/material.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset("assets/images/qur2an_screen_logo.png"),
            ),
         
        ],
      ),
    );
  }
}

import 'package:app_get_feedback/home_card.dart';
import 'package:flutter/material.dart';

import 'feedback_agricultorAberta_screen.dart';
import 'feedback_agricultor_screen.dart';

class HomeAgricultorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback AgroSulPiauí'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              "Questionário Agricultor",
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(height: 50),
            HomeCard(
              title: 'Questões Fechadas',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedbackAgricultorScreen()),
                );
              },
            ),
            HomeCard(
              title: 'Questões Abertas',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedbackAgricultorAbertaScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

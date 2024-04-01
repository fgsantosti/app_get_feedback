import 'package:app_get_feedback/feedback_participante_screen.dart';
import 'package:app_get_feedback/home_card.dart';
import 'package:flutter/material.dart';
import 'feedback_participanteAberta_sreen.dart';

class HomeParticipanteScreen extends StatelessWidget {
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
              "Questionário Parcitipante",
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(height: 50),
            HomeCard(
              title: 'Questões Fechadas',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedbackParticipanteScreen()),
                );
              },
            ),
            HomeCard(
              title: 'Questões Abertas',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedbackParticipanteAbertaScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:app_get_feedback/home_card.dart';
import 'package:app_get_feedback/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'home_agricultor.dart';
import 'home_participante.dart';

class HomeScreen extends StatelessWidget {
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
            HomeCard(
              title: 'Participante',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeParticipanteScreen()),
                );
              },
            ),
            HomeCard(
              title: 'Agricultor',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeAgricultorScreen()),
                );
              },
            ),
            HomeCard(
              title: 'Visualizar Estatísticas',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatisticsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

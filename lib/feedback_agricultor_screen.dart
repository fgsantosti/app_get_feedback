import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'home_agricultor.dart';

class FeedbackAgricultorScreen extends StatefulWidget {
  @override
  _FeedbackAgricultorScreen createState() => _FeedbackAgricultorScreen();
}

class _FeedbackAgricultorScreen extends State<FeedbackAgricultorScreen> {
  int currentQuestion = 0;
  List<String> questions = [
    'Como foram suas vendas durante o evento?',
    'O espaço fornecido para exposição atendeu às suas expectativas?',
    'Houve um interesse significativo pelos seus produtos?',
    'O evento proporcionou oportunidades de trocas de experiências benéficas para você?',
    'Você fez novos contatos comerciais durante a feira?',
    'Como você avalia a logística do evento em relação aos produtores?'
  ];
  List<int> feedbackList = List.filled(6, 0);

  void submitFeedback(int rating) {
    setState(() {
      feedbackList[currentQuestion] = rating;
      if (currentQuestion < 5) {
        currentQuestion++;
      } else {
        saveFeedbackToJson();
        print("Feedback submitted: $feedbackList");

        // Após responder à última pergunta, automaticamente redirecione para a página inicial.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeAgricultorScreen()),
        );
      }
    });
  }

  Future<void> saveFeedbackToJson() async {
    Map<String, dynamic> feedbackData = {
      'questions': questions,
      'feedback': feedbackList,
    };

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/feedback_data.json');

    await file.writeAsString(jsonEncode(feedbackData));
  }

  void finishQuestionnaire() {
    // Aqui você pode adicionar qualquer lógica adicional ao finalizar o questionário.
    Navigator.pop(
        context); // Retorna à tela anterior (página inicial neste caso).
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qestões Fechadas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Pergunta ${currentQuestion + 1}: ${questions[currentQuestion]}'),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                for (int i = 1; i <= 5; i++)
                  ElevatedButton(
                    onPressed: () => submitFeedback(i),
                    child: Text('$i'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

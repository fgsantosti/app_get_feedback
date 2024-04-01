import 'package:app_get_feedback/home_participante.dart';
import 'package:flutter/material.dart';

class FeedbackParticipanteScreen extends StatefulWidget {
  @override
  _FeedbackParticipanteScreen createState() => _FeedbackParticipanteScreen();
}

class _FeedbackParticipanteScreen extends State<FeedbackParticipanteScreen> {
  int currentQuestion = 0;
  int quantQuestion = 16;
  List<String> questions = [
    'Como você avaliaria sua experiência geral no evento?',
    'Como você avalia o credenciamento?',
    'Como você avalia o site?',
    'Como você avalia a divulgação?',
    'Como você avalia os minicursos?',
    'Como você avalia as oficinas?',
    'Como você avalia as mesas redondas?',
    'Como você avalia as palestras?',
    'Como você avalia os seminários temáticos?',
    'Como você avalia a feira exposição dos pequenos produtores?',
    'Como você avalia a praça de alimentação?',
    'Como você avalia as atrações culturais?',
    'Como você avalia a sinalização?',
    'Como você avalia os palestrantes?',
    'Como você avalia o funcionamento das dependências (banheiros, bebedouros, salas...)',
    'Como você avalia a organização geral do evento?',
    'Como você avalia o atendimento da saúde?',
  ];
  List<int> feedbackList = List.filled(17, 0);

  void submitFeedback(int rating) {
    setState(() {
      feedbackList[currentQuestion] = rating;
      if (currentQuestion < 16) {
        currentQuestion++;
      } else {
        print("Feedback submitted: $feedbackList");

        // Após responder à última pergunta, automaticamente redirecione para a página inicial.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeParticipanteScreen()),
        );
      }
    });
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
        title: Text('Questões Fechadas'),
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

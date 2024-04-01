import 'package:app_get_feedback/home_participante.dart';
import 'package:flutter/material.dart';

class FeedbackParticipanteScreen extends StatefulWidget {
  @override
  _FeedbackParticipanteScreen createState() => _FeedbackParticipanteScreen();
}

class _FeedbackParticipanteScreen extends State<FeedbackParticipanteScreen> {
  int currentQuestion = 0;
  int quantQuestion = 17;
  List<String> questions = [
    'Como você avaliaria sua experiência geral no evento?',
    'O que achou do credenciamento?',
    'O que achou do site?',
    'O que achou da divulgação?',
    'O que achou dos minicursos?',
    'O que achou dos oficinas?',
    'O que achou das mesas redondas?',
    'O que achou das palestras?',
    'O que achou dos seminários temáticos?',
    'O que achou da feira exposição dos pequenos produtores?',
    'O que achou da praça de alimentação?',
    'O que achou das atrações culturais?',
    'O que achou da sinalização?',
    'O que achou dos palestrantes?',
    'O que achou do funcionamento das dependências (banheiros, bebedouros, salas...)',
    'O que achou da organização geral do evento?',
    'O que achou do atendimento da saúde?',
    'Adquiriu algum produto na feira?',
  ];
  List<int> feedbackList = List.filled(18, 0);

  void submitFeedback(int rating) {
    setState(() {
      feedbackList[currentQuestion] = rating;
      if (currentQuestion < 17) {
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

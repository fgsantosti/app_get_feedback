import 'package:app_get_feedback/home_participante.dart';
import 'package:flutter/material.dart';

class FeedbackParticipanteAbertaScreen extends StatefulWidget {
  @override
  _FeedbackParticipanteAbertaScreen createState() =>
      _FeedbackParticipanteAbertaScreen();
}

class _FeedbackParticipanteAbertaScreen
    extends State<FeedbackParticipanteAbertaScreen> {
  List<String> questions = [
    'O que mais gostou no evento?',
    'Qual foi a atividade mais interessante para você?',
    'Como você avaliaria a diversidade de atividades oferecidas?',
    'Algum aspecto específico da organização que você destacaria?',
    'Há algo que poderia ser melhorado no evento?',
    'Você tem sugestões para tornar a próxima edição ainda mais atraente?',
    'Você viria novamente para o evento no próximo ano?',
    'O que te atraiu a participar do evento?'
  ];
  List<String> answers =
      List.filled(8, ''); // Lista para armazenar as respostas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questões Abertas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < questions.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pergunta ${i + 1}: ${questions[i]}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            answers[i] =
                                value; // Atualiza a resposta correspondente à pergunta
                          });
                        },
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Salve as respostas como um único array
                    print('Respostas: $answers');
                    // Implemente a lógica para salvar as respostas como necessário
                    // Após responder enviar a resposta, automaticamente redirecione para a página inicial.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeParticipanteScreen()),
                    );
                  },
                  child: Text('Enviar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  // Implemente conforme necessário
}

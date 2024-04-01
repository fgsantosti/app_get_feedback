import 'package:flutter/material.dart';

import 'home_agricultor.dart';

class FeedbackAgricultorAbertaScreen extends StatefulWidget {
  @override
  _FeedbackAgricultorAbertaScreen createState() =>
      _FeedbackAgricultorAbertaScreen();
}

class _FeedbackAgricultorAbertaScreen
    extends State<FeedbackAgricultorAbertaScreen> {
  List<String> questions = [
    'Algum problema logístico afetou sua participação?',
    'Que tipo de apoio adicional você gostaria de ver em futuras edições?',
    'Alguma sugestão específica para melhorar a participação dos produtores?',
    'Você viria novamente para o evento no próximo ano?'
  ];
  List<String> answers =
      List.filled(4, ''); // Lista para armazenar as respostas

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
                    // Após responder enviar a resposta, automaticamente redirecione para a página inicial.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeAgricultorScreen()),
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

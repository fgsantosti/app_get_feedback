import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  Future<List<int>?> loadFeedbackFromJson() async {
    try {
      final file = File('feedback_data.json');
      if (await file.exists()) {
        final String content = await file.readAsString();
        final Map<String, dynamic> feedbackData = jsonDecode(content);
        return List<int>.from(feedbackData['feedback']);
      }
    } catch (e) {
      print('Erro ao carregar dados do arquivo: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estatísticas'),
      ),
      body: FutureBuilder<List<int>?>(
        future: loadFeedbackFromJson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum feedback disponível'));
          } else {
            final answers = snapshot.data!;
            final total = answers.length.toDouble();
            final sum = answers.fold(0, (sum, answer) => sum + answer);
            final average = total > 0 ? sum / total : 0;

            return ListTile(
              title: Text('Média de Feedbacks'),
              subtitle: Text('Média: ${average.toStringAsFixed(2)}'),
            );
          }
        },
      ),
    );
  }
}

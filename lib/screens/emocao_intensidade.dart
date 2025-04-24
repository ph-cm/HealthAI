// emocao_intensidade.dart
import 'package:flutter/material.dart';

class EmocaoIntensidadeScreen extends StatefulWidget {
  final String emocao;
  
  const EmocaoIntensidadeScreen({
    Key? key,
    required this.emocao,
  }) : super(key: key);

  @override
  _EmocaoIntensidadeScreenState createState() => _EmocaoIntensidadeScreenState();
}

class _EmocaoIntensidadeScreenState extends State<EmocaoIntensidadeScreen> {
  double _intensidade = 3.0; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intensidade de ${widget.emocao}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quão intenso está seu sentimento de ${widget.emocao}?',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Slider(
              value: _intensidade,
              min: 1,
              max: 5,
              divisions: 4,
              label: _intensidade.round().toString(),
              onChanged: (value) {
                setState(() {
                  _intensidade = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Intensidade: ${_intensidade.round()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/emocao-reflexao',
                  arguments: {
                    'emocao': widget.emocao,
                    'intensidade': _intensidade.round(),
                  },
                );
              },
              child: Text('Continuar'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
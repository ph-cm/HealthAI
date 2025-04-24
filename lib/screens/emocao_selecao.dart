import 'package:flutter/material.dart';

class EmotionSelectionScreen extends StatefulWidget {
  const EmotionSelectionScreen({super.key});

  @override
  _EmotionSelectionScreenState createState() => _EmotionSelectionScreenState();
}

class _EmotionSelectionScreenState extends State<EmotionSelectionScreen> {
  final List<Map<String, dynamic>> emotions = [
    {'emoji': '😊', 'name': 'Feliz'},
    {'emoji': '😢', 'name': 'Triste'},
    {'emoji': '😠', 'name': 'Bravo'},
    {'emoji': '😨', 'name': 'Ansioso'},
    {'emoji': '😌', 'name': 'Calmo'},
  ];
  
  String? selectedEmotion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Como você está se sentindo?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Selecione uma emoção para refletir:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: emotions.map((emotion) => ChoiceChip(
                avatar: Text(emotion['emoji'], style: const TextStyle(fontSize: 24)),
                label: Text(emotion['name']),
                selectedColor: Colors.purple[200],
                selected: selectedEmotion == emotion['name'],
                onSelected: (val) {
                  setState(() {
                    selectedEmotion = val ? emotion['name'] : null;
                  });
                },
              )).toList(),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: selectedEmotion != null
                  ? () {
                      Navigator.pushNamed(
                        context,
                        '/emocao-intensidade',
                        arguments: selectedEmotion,
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.purple,
                disabledBackgroundColor: Colors.purple[100],
              ),
              child: const Text(
                'Próximo',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
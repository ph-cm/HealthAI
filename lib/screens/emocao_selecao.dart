import 'package:flutter/material.dart';

class EmotionSelectionScreen extends StatefulWidget {
  const EmotionSelectionScreen({super.key});

  @override
  _EmotionSelectionScreenState createState() => _EmotionSelectionScreenState();
}

class _EmotionSelectionScreenState extends State<EmotionSelectionScreen> {
  final List<Map<String, dynamic>> emotions = [
    {'name': 'Animado', 'color': Color(0xFFFFF176)},
    {'name': 'Desanimado', 'color': Color(0xFF81D4FA)},
    {'name': 'Irritado', 'color': Color(0xFFEF9A9A)},
    {'name': 'Confuso', 'color': Color(0xFFCE93D8)},
  ];

  String? selectedEmotion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3ECFB),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Pergunta", style: TextStyle(color: Colors.grey)),
                  Row(
                    children: List.generate(4, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0 ? Colors.purple : Colors.grey[300],
                        ),
                      );
                    }),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Pular", style: TextStyle(color: Colors.grey)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Como se sente agora?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: Image.asset('assets/saudacoes.png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))
                ],
              ),
              child: Column(
                children: emotions.map((emotion) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => selectedEmotion = emotion['name']);
                        print('Clicou na emoção: ${emotion['name']}');
                        Navigator.pushNamed(
                          context,
                          '/emocao-reflexao',
                          arguments: emotion['name'],
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: emotion['color'],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedEmotion == emotion['name'] ? Colors.deepPurple : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          emotion['name'],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.phone, color: Colors.grey),
                  Icon(Icons.home, color: Colors.grey),
                  Icon(Icons.calendar_today, color: Colors.grey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

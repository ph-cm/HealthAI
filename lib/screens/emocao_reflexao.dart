import 'package:flutter/material.dart';

class EmocaoReflexaoScreen extends StatefulWidget {
  final String emocao;

  const EmocaoReflexaoScreen({super.key, required this.emocao});

  @override
  State<EmocaoReflexaoScreen> createState() => _EmocaoReflexaoScreenState();
}

class _EmocaoReflexaoScreenState extends State<EmocaoReflexaoScreen> {
  final List<String> motivos = [
    'Pensamentos',
    'Discussão',
    'Algo que aconteceu no meu dia',
    'Não tenho certeza',
  ];

  String? motivoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3ECFB),
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho
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
                          color: index == 1 ? Colors.purple : Colors.grey[300],
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
              "O que motivou esse sentimento?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: Image.asset('assets/feliz.png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 20),
            // Cartão de opções
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
                children: motivos.map((motivo) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => motivoSelecionado = motivo);
                        Navigator.pushNamed(
                          context,
                          '/emocao-feedback',
                          arguments: {
                            'emocao': widget.emocao,
                            'motivo': motivo,
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F4F9),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: motivoSelecionado == motivo ? Colors.deepPurple : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          motivo,
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
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

class AtividadeDescricaoPage extends StatefulWidget {
  const AtividadeDescricaoPage({super.key});

  @override
  State<AtividadeDescricaoPage> createState() => _AtividadeDescricaoPageState();
}

class _AtividadeDescricaoPageState extends State<AtividadeDescricaoPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Leaf> _leaves;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 30))..repeat();
    _leaves = List.generate(30, (index) => Leaf());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF6),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                painter: LeafPainter(_leaves, _controller.value),
                child: Container(),
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Respiração Profunda",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7C4D8A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Image.asset('assets/meditando.png', height: 250),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFEF6),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Text(
                      "Nesta atividade, você será guiado(a) por um processo simples e eficaz de respiração.\n\n"
                      "Inspire lentamente, segure por alguns segundos e expire com calma.\n\n"
                      "Repita esse ciclo por cerca de 10 minutos.",
                      style: TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2DCF4),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Text(
                      "✨ Benefícios: Redução da ansiedade e melhora no foco.",
                      style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/atividade-respiracao');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC793CF),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Fazer Atividade",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Leaf {
  final double x = Random().nextDouble();                    // posição horizontal
  final double width = Random().nextDouble() * 30 + 10;      // largura da folha
  final double height = Random().nextDouble() * 15 + 8;      // altura da folha
  final double speed = Random().nextDouble() * 0.5 + 0.2;    // velocidade
  final double sway = Random().nextDouble() * 0.4 + 0.1;     // oscilação
  final double angle = Random().nextDouble() * pi * 2;       // rotação
  final double startOffset = Random().nextDouble();          // início aleatório
  final Color color = const Color(0xFFC793CF);             // cor lilás
}


class LeafPainter extends CustomPainter {
  final List<Leaf> leaves;
  final double progress;

  LeafPainter(this.leaves, this.progress);

@override
void paint(Canvas canvas, Size size) {
  for (var leaf in leaves) {
    double leafProgress = (progress + leaf.startOffset * leaf.speed) % 1.0;

    final dx = leaf.x * size.width +
        sin(leafProgress * 2 * pi + leaf.x * 10) * 20 * leaf.sway;
    final dy = leafProgress * size.height;

    final paint = Paint()..color = leaf.color.withOpacity(0.4);
    canvas.save();
    canvas.translate(dx, dy);
    canvas.rotate(leaf.angle);
    canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: leaf.width, height: leaf.height), paint);
    canvas.restore();
  }
}



  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
  
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TelaRespiracao extends StatefulWidget {
  const TelaRespiracao({super.key});

  @override
  State<TelaRespiracao> createState() => _TelaRespiracaoState();
}

class _TelaRespiracaoState extends State<TelaRespiracao> {
  final List<_Fase> fases = [
    _Fase("Inspire", 20),
    _Fase("Segure", 10),
    _Fase("Expire", 20),
  ];
  int faseAtual = 0;
  int segundosRestantes = 0;
  Timer? timer;

  bool iniciado = false;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void iniciarFase() {
    setState(() {
      iniciado = true;
      segundosRestantes = fases[faseAtual].duracao;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (segundosRestantes > 1) {
        setState(() {
          segundosRestantes--;
        });
      } else {
        t.cancel();
        if (faseAtual < fases.length - 1) {
          setState(() {
            faseAtual++;
          });
          iniciarFase();
        } else {
          setState(() {
            iniciado = false;
            faseAtual = 0;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final fase = fases[faseAtual];
    final double progresso = iniciado
        ? 1 - (segundosRestantes / fase.duracao)
        : 0;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF6),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Respiração Profunda",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF6A357E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  "assets/meditando.png",
                  height: 250,
                ),
                CircularPercentIndicator(
                  radius: 120,
                  lineWidth: 16,
                  percent: progresso.clamp(0.0, 1.0),
                  animation: true,
                  animateFromLastPercent: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFFB97CCF),
                  backgroundColor: const Color(0xFFE7D8F1),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        fase.nome,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A357E),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${iniciado ? segundosRestantes : fase.duracao} segundos",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF6A357E),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: iniciado ? null : iniciarFase,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD8B4E2),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Começar",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Fase {
  final String nome;
  final int duracao;

  _Fase(this.nome, this.duracao);
}

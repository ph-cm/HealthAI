import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final List<bool> streak = [true, true, false, true, false, true, true];
    final List<String> weekDays = ['S', 'T', 'Q', 'Q', 'S', 'S', 'D'];

    int currentStreak = 0;
    for (int i = streak.length - 1; i >= 0; i--) {
      if (streak[i]) {
        currentStreak++;
      } else {
        break;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container unificado com avatar, saudação e streak
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Olá, Pedro!",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Pronto para mais um dia saudável?",
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F3F7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "$currentStreak dias seguidos de melhora",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(streak.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: streak[index] ? Colors.amber : Colors.grey[300],
                                      size: screenWidth * 0.07,
                                    ),
                                    Text(
                                      weekDays[index],
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: streak[index] ? Colors.white : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Curiosidade do Dia
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Curiosidade do Dia",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Respirar profundamente por 3 minutos pode reduzir sua frequência cardíaca e aliviar a ansiedade.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Seção com balão de fala e imagem do gato (área modificada)
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Balão de fala (mantido igual)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 80),
                            child: CustomPaint(
                              painter: RightPointingBubblePainter(),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Como você está se sentindo?",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      // Imagem do gato com ajuste para os bigodes
                      Transform.translate(
                        offset: const Offset(-15, 0), // Move um pouco para esquerda
                        child: Container(
                          padding: const EdgeInsets.only(left: 5), // Espaço para os bigodes
                          child: const Image(
                            image: AssetImage('assets/saudacoes.png'),
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                    const SizedBox(height: 24),
                    
                    // Botões
                    Row(
                      children: [
                       
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/emocao-selecao');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC793CF),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              "Registrar Emoções",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),
                        
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                            Navigator.pushNamed(context, '/selecao-psicologo');
                          },                                                                                                                                                                                                     

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC793CF),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              "Agendar Consulta",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Sugestões do Psicólogo
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sugestões de Hoje",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          ),
                          ),
      const SizedBox(height: 12),

      // Sugestão clicável com navegação
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/atividade-descricao');
        },
        child: suggestionTile(Icons.spa, "Respiração profunda por 10 minutos"),
      ),

      suggestionTile(Icons.directions_walk, "Caminhar por 30 minutos"),
      suggestionTile(Icons.no_food, "Evitar açúcar refinado"),
    ],
  ),
),
const SizedBox(height: 20),


              Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Ajuda de Emergência'),
                      content: const Text('Deseja contactar os serviços de emergência?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implementar chamada real aqui
                            Navigator.pop(context);
                          },
                          child: const Text('Ligar para 188'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 49, 41),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50)
                ),
                child: const Text(
                  'EMERGÊNCIA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFC793CF),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/video-chamada');
          }
          if (index == 2){
            Navigator.pushNamed(context, '/calendario');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Consulta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendario',
          ),
        ],
      ),

    );
  }

  Widget suggestionTile(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC793CF)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}

class RightPointingBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final radius = 50.0;
    final triangleWidth = 15.0;
    // ignore: unused_local_variable
    final triangleHeight = 50.0;
    final triangleBase = 24.0;

    final path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius - triangleWidth, 0)
      ..arcToPoint(
        Offset(size.width - triangleWidth, radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width - triangleWidth, size.height/2 - triangleBase/2)
      ..lineTo(size.width, size.height/2)
      ..lineTo(size.width - triangleWidth, size.height/2 + triangleBase/2)
      ..lineTo(size.width - triangleWidth, size.height - radius)
      ..arcToPoint(
        Offset(size.width - radius - triangleWidth, size.height),
        radius: Radius.circular(radius),
      )
      ..lineTo(radius, size.height)
      ..arcToPoint(
        Offset(0, size.height - radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(0, radius)
      ..arcToPoint(
        Offset(radius, 0),
        radius: Radius.circular(radius),
      )
      ..close();

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
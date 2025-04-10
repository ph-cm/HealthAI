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
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
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
                          const SizedBox(height: 8),
                          Text(
                            "  $currentStreak dias seguidos de melhora",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(streak.length, (index) {
                              return Flexible(
                                child: Column(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: streak[index] ? Colors.amber : Colors.grey[300],
                                            size: screenWidth * 0.08,
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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC793CF),
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Agendar Consulta",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Sugestões de Hoje",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    suggestionTile("Respiração profunda por 10 minutos", Icons.local_drink),
                    suggestionTile("Caminhar por 30 minutos", Icons.directions_walk),
                    suggestionTile("Evitar açúcar refinado", Icons.no_food),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: screenWidth * 0.3,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Center(
                            child: Icon(Icons.emergency, color: Color.fromARGB(255, 112, 32, 32), size: 100),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text("Emergência", style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: screenWidth * 0.3,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC793CF),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Image.asset('assets/cat_icon.png', height: screenWidth * 0.6),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text("Chat-Cat", style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Emergência',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Agenda',
                ),
              ],
            ),

    );
  }

  Widget suggestionTile(String text, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.deepPurple),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}

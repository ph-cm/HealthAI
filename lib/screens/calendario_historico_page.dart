import 'package:flutter/material.dart';

class CalendarioHistoricoPage extends StatefulWidget {
  const CalendarioHistoricoPage({super.key});

  @override
  State<CalendarioHistoricoPage> createState() => _CalendarioHistoricoPageState();
}

class _CalendarioHistoricoPageState extends State<CalendarioHistoricoPage> {
  String? selectedInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          const Text('JAN 2025', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildCalendar(),
          const SizedBox(height: 16),
          if (selectedInfo != null) _buildInfoCard(selectedInfo!),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
        ],
        onTap: (index) {
          // Aqui você pode adicionar navegação
        },
      ),
    );
  }

  Widget _buildCalendar() {
    List<Widget> rows = [];
    for (int week = 0; week < 5; week++) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (day) {
          int dayIndex = week * 7 + day;
          return GestureDetector(
            onTap: () {
              setState(() {
                if (dayIndex == 10) {
                  selectedInfo = 'consulta';
                } else if (dayIndex == 12) {
                  selectedInfo = 'relatorio';
                } else {
                  selectedInfo = null;
                }
              });
            },
            child: _buildDayIcon(dayIndex),
          );
        }),
      ));
      rows.add(const SizedBox(height: 10));
    }
    return Column(children: rows);
  }

  Widget _buildDayIcon(int index) {
    if ([2, 5, 9, 15, 16, 17, 18, 19].contains(index)) {
      return const CircleAvatar(radius: 10, backgroundColor: Colors.amber);
    } else if (index == 10) {
      return const CircleAvatar(radius: 14, backgroundImage: AssetImage('assets/avatar_psicologa.png'));
    } else if (index == 12) {
      return const Icon(Icons.description, size: 24, color: Colors.grey);
    } else {
      return const CircleAvatar(radius: 10, backgroundColor: Color(0xFFD9D9D9));
    }
  }

  Widget _buildInfoCard(String type) {
    if (type == 'consulta') {
      return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFF4EDF9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: const [
            CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/avatar_psicologa.png')),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: Gabriela Lopes'),
                  Text('Data: 25/01/2025'),
                  Text('Duração: 24:43 min.')
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFF4EDF9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: const [
            Icon(Icons.description, size: 36),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Progresso: Melhorando'),
                  Text('Dificuldades: Sono'),
                  Text('Foco atual: Resiliência'),
                  Text('Última sessão: 01/02/2025')
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

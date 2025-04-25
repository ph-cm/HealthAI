import 'package:flutter/material.dart';

class CalendarioHistoricoPage extends StatefulWidget {
  const CalendarioHistoricoPage({super.key});

  @override
  State<CalendarioHistoricoPage> createState() => _CalendarioHistoricoPageState();
}

class _CalendarioHistoricoPageState extends State<CalendarioHistoricoPage> {
  String? selectedInfo;

  final Map<int, String> eventos = {
    4: 'fogo',
    5: 'fogo',
    9: 'consulta',
    11: 'relatorio',
    15: 'fogo',
    16: 'fogo',
    17: 'fogo',
    18: 'fogo',
    19: 'fogo',
    20: 'fogo',
    21: 'fogo',
    22: 'fogo',
    23: 'fogo',
    29: 'consulta',
    31: 'relatorio',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Calendário', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32), // <-- Espaço maior para "abaixar" o calendário
            const Text(
              'JAN 2025',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A1D56),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 8),
            _buildWeekDays(),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCalendar(),
                    const SizedBox(height: 24),
                    if (selectedInfo != null) _buildInfoCard(selectedInfo!),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
        ],
        onTap: (index) {
          // navegação futura
        },
      ),
    );
  }

  Widget _buildWeekDays() {
    const days = ['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: days.map((day) => Text(day, style: const TextStyle(fontWeight: FontWeight.bold))).toList(),
    );
  }

  Widget _buildCalendar() {
    List<Widget> rows = [];
    int totalDays = 31;
    int startWeekDay = 2;

    List<Widget> days = [];

    for (int i = 0; i < startWeekDay; i++) {
      days.add(_buildEmptyDay());
    }

    for (int i = 1; i <= totalDays; i++) {
      days.add(_buildDay(i));
    }

    for (int i = 0; i < days.length; i += 7) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: days.skip(i).take(7).toList(),
        ),
      );
      rows.add(const SizedBox(height: 12));
    }

    return Column(children: rows);
  }

  Widget _buildEmptyDay() {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE0E0E0),
      ),
    );
  }

 Widget _buildDay(int day) {
  Widget content;

  if (eventos.containsKey(day)) {
    switch (eventos[day]) {
      case 'consulta':
        content = CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue[100],
          backgroundImage: const AssetImage('assets/avatar_psicologa.png'),
        );
        break;
      case 'relatorio':
        content = const Icon(Icons.description, size: 30, color: Colors.grey);
        break;
      case 'fogo':
        content = Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Color(0xFFFFE0B2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.local_fire_department,
            color: Colors.deepOrange,
            size: 30,
          ),
        );
        break;
      default:
        content = Text('$day');
    }
  } else {
    content = Text(
      '$day',
      style: const TextStyle(fontSize: 16),
    );
  }

  return GestureDetector(
    onTap: () {
      setState(() {
        final tipo = eventos[day];
        if (tipo == 'consulta' || tipo == 'relatorio') {
          selectedInfo = tipo;
        } else {
          selectedInfo = null;
        }
      });
    },
    child: Container(
      width: 48,
      height: 48,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: eventos.containsKey(day) ? Colors.transparent : const Color(0xFFD9D9D9),
      ),
      alignment: Alignment.center,
      child: content,
    ),
  );
}


  Widget _buildInfoCard(String type) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(minHeight: 220),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF4EDF9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: type == 'consulta' ? _buildConsultaCard() : _buildRelatorioCard(),
    );
  }

 Widget _buildConsultaCard() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage('assets/avatar_psicologa.png'),
      ),
      SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: Gabriela Lopes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Text('Data: 25/01/2025', style: TextStyle(fontSize: 16)),
            Text('Duração: 24:43 min.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      Icon(Icons.chevron_right, size: 32, color: Colors.grey),
    ],
  );
}


  Widget _buildRelatorioCard() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Icon(Icons.description, size: 50, color: Colors.deepPurple),
      SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Progresso: Melhorando', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Text('Dificuldades: Sono', style: TextStyle(fontSize: 16)),
            Text('Foco atual: Resiliência', style: TextStyle(fontSize: 16)),
            Text('Última sessão: 01/02/2025', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      Icon(Icons.chevron_right, size: 32, color: Colors.grey),
    ],
  );
}

}

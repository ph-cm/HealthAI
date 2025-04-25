import 'package:flutter/material.dart';

class SelecaoPsicologoPage extends StatelessWidget {
  const SelecaoPsicologoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0F8),
      appBar: AppBar(
        title: const Text(
          'Selecao Psicologo',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: const Color(0xFFF4F0F8),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                PsicologoCard(
                  nome: 'Gabriela Lopes',
                  crp: '06/123456',
                  especialidades: 'Ansiedade | Adolescência',
                  imagemAsset: 'assets/avatar_psicologa.png',
                ),
                PsicologoCard(
                  nome: 'Letícia Mendes',
                  crp: '04/445566',
                  especialidades: 'Psicologia Clínica | Terapia Infantil',
                  imagemAsset: 'assets/leticia.png',
                ),
                PsicologoCard(
                  nome: 'João Ferreira',
                  crp: '05/987654',
                  especialidades: 'Adultos | Terapia Sistêmica',
                  imagemAsset: 'assets/joao.png',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // ação ao confirmar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD5A9F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Confirmar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PsicologoCard extends StatelessWidget {
  final String nome;
  final String crp;
  final String especialidades;
  final String imagemAsset;

  const PsicologoCard({
    super.key,
    required this.nome,
    required this.crp,
    required this.especialidades,
    required this.imagemAsset,
  });

  @override
Widget build(BuildContext context) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 4,
    child: Container(
      padding: const EdgeInsets.all(16),
      height: 130,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagemAsset,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5E348F),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'CRP: $crp',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Text(
                  especialidades,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20),
        ],
      ),
    ),
  );
}

}

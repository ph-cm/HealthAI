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
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagemAsset),
          radius: 28,
        ),
        title: Text(
          'Nome: $nome',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CRP: $crp'),
            const SizedBox(height: 4),
            Text(especialidades),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

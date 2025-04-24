import 'package:flutter/material.dart';

class EmocaoReflexaoScreen extends StatefulWidget {
  final String emocao;
  final int intensidade;

  const EmocaoReflexaoScreen({
    Key? key,
    required this.emocao,
    required this.intensidade,
  }) : super(key: key);

  @override
  _EmocaoReflexaoScreenState createState() => _EmocaoReflexaoScreenState();
}
// BACKEND ENVIAR DADOS PARAA O BANCO
class _EmocaoReflexaoScreenState extends State<EmocaoReflexaoScreen> {
  final TextEditingController _reflexaoController = TextEditingController();

  void _finalizarRegistro() {
    // ignore: unused_local_variable
    String reflexao = _reflexaoController.text;
    // Aqui você pode salvar os dados em um banco, enviar para backend, etc.

    Navigator.pushNamed(context, '/emocao-grafico'); // Altere para a rota correta
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflexão'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Você escolheu: ${widget.emocao} com intensidade ${widget.intensidade}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Deseja escrever algo sobre isso?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _reflexaoController,
              maxLines: 6,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite aqui sua reflexão...',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _finalizarRegistro,
                child: const Text('Finalizar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

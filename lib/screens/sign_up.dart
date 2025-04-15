import 'package:flutter/material.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreeTerms = false;
  bool isPsychologist = false;
  bool _showLocationSection = false;
  DateTime? _birthDate;
  final TextEditingController _birthDateController = TextEditingController();

  @override
  void dispose() {
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Image.asset('assets/cat_icon.png', height: 120),
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Register New Account',
                style: TextStyle(color: Colors.purple, fontSize: 14),
              ),
              const SizedBox(height: 20),

              // Seção 1: Dados Essenciais
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dados Pessoais',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildInputField(Icons.person_3_outlined, 'Nome Completo'),
                    buildInputField(Icons.email_outlined, 'Email ou Telefone'),
                    
                    // Campo de data de nascimento
                    buildDateField(context, 'Data de Nascimento'),
                    
                    if (_birthDate == null && agreeTerms)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Por favor, selecione sua data de nascimento',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    
                    buildInputField(Icons.lock_outline, 'Senha', obscure: true),
                    buildInputField(Icons.lock_outline, 'Confirmar senha', obscure: true),
                    
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: isPsychologist,
                          onChanged: (value) {
                            setState(() {
                              isPsychologist = value!;
                            });
                          },
                        ),
                        const Text("Sou psicólogo(a)"),
                      ],
                    ),
                    if (isPsychologist)
                      buildInputField(Icons.credit_card, 'CIP/CRP'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Botão para mostrar/ocultar seção de localização
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showLocationSection = !_showLocationSection;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC793CF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  _showLocationSection ? 'Ocultar Localização' : 'Adicionar Localização',
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              // Seção 2: Localização (aparece condicionalmente)
              if (_showLocationSection)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Localização',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 16),
                      buildInputField(Icons.badge, 'CPF'),
                      
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF7EBF0),
                                  prefixIcon: const Icon(Icons.markunread_mailbox, color: Colors.purple),
                                  hintText: 'CEP',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                // lógica de cálculo do endereço via CEP
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFC793CF),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Calcular'),
                            ),
                          ],
                        ),
                      ),

                      buildInputField(Icons.location_on_outlined, 'Rua'),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF7EBF0),
                                  prefixIcon: const Icon(Icons.home, color: Colors.purple),
                                  hintText: 'Número',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF7EBF0),
                                  hintText: 'Complemento',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      buildInputField(Icons.location_city, 'Bairro'),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Checkbox(
                    value: agreeTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeTerms = value!;
                      });
                    },
                  ),
                  const Flexible(
                    child: Text.rich(TextSpan(
                      children: [
                        TextSpan(text: 'I agree with '),
                        TextSpan(
                          text: 'Terms Of Services',
                          style: TextStyle(color: Colors.purple),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Policy Privacy.',
                          style: TextStyle(color: Colors.purple),
                        ),
                      ],
                    )),
                  ),
                ],
              ),

              if (_birthDate == null && agreeTerms)
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Por favor, selecione sua data de nascimento',
                    style: TextStyle(color: Colors.red),
                  ),
                ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: agreeTerms && _birthDate != null
                      ? () {
                          // Dados que serão enviados
                          final userData = {
                            'birthDate': _birthDate,
                            // Adicione aqui os outros campos do formulário
                          };
                          
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC793CF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text("Have your any problem? Help"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(IconData icon, String hint, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF7EBF0),
          prefixIcon: Icon(icon, color: Colors.purple),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
          ),
        ),
      ),
    );
  }

  Widget buildDateField(BuildContext context, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: _birthDateController,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF7EBF0),
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.purple),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD3D3D3)),
          ),
        ),
        readOnly: true,
        onTap: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          
          if (selectedDate != null) {
            setState(() {
              _birthDate = selectedDate;
              _birthDateController.text = 
                '${selectedDate.day.toString().padLeft(2,'0')}/'
                '${selectedDate.month.toString().padLeft(2,'0')}/'
                '${selectedDate.year}';
            });
          }
        },
      ),
    );
  }
}
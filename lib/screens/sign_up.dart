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

              buildInputField(Icons.person_3_outlined, 'Nome Completo'),
              buildInputField(Icons.email_outlined, 'Email ou Telefone'),
              buildInputField(Icons.badge, 'CPF'),
              buildInputField(Icons.lock_outline, 'Senha', obscure: true),
              buildInputField(Icons.lock_outline, 'Confirmar senha', obscure: true),

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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: agreeTerms
                      ? () {
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
}

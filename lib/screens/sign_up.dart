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
  DateTime? _birthDate;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _birthDateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
          child: Form(
            key: _formKey,
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
                  'Cadastro',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Dados Essenciais
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
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
                    children: [
                      _buildTextFormField(
                        label: 'Nome Completo',
                        icon: Icons.person,
                        controller: _nameController,
                        validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'E-mail',
                        icon: Icons.email,
                        controller: _emailController,
                        validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'CPF',
                        icon: Icons.badge,
                        controller: _cpfController,
                        validator: (value) {
                          if (value!.isEmpty) return 'Campo obrigatório';
                          if (value.length < 11) return 'CPF inválido';
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      _buildDateField(context),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Senha',
                        icon: Icons.lock,
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) return 'Campo obrigatório';
                          if (value.length < 6) return 'Mínimo 6 caracteres';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Confirmar Senha',
                        icon: Icons.lock,
                        controller: _confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Senhas não coincidem';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: isPsychologist,
                            onChanged: (value) => setState(() => isPsychologist = value!),
                          ),
                          const Text("Sou psicólogo(a)"),
                        ],
                      ),
                      if (isPsychologist)
                        _buildTextFormField(
                          label: 'CRP/CIP',
                          icon: Icons.credit_card,
                          validator: (value) => 
                            isPsychologist && value!.isEmpty ? 'Campo obrigatório' : null,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Termos e Condições
                Row(
                  children: [
                    Checkbox(
                      value: agreeTerms,
                      onChanged: (value) => setState(() => agreeTerms = value!),
                    ),
                    const Flexible(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Aceito os '),
                            TextSpan(
                              text: 'Termos de Serviço',
                              style: TextStyle(color: Colors.purple),
                            ),
                            TextSpan(text: ' e '),
                            TextSpan(
                              text: 'Política de Privacidade',
                              style: TextStyle(color: Colors.purple),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Botão de Cadastro
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC793CF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "CADASTRAR",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required IconData icon,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.purple),
        filled: true,
        fillColor: const Color(0xFFF7EBF0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return TextFormField(
      controller: _birthDateController,
      readOnly: true,
      validator: (value) => _birthDate == null ? 'Selecione uma data' : null,
      decoration: InputDecoration(
        labelText: 'Data de Nascimento',
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.purple),
        filled: true,
        fillColor: const Color(0xFFF7EBF0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          setState(() {
            _birthDate = date;
            _birthDateController.text =
              "${date.day.toString().padLeft(2,'0')}/"
              "${date.month.toString().padLeft(2,'0')}/"
              "${date.year}";
          });
        }
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && agreeTerms) {
      // Formulário válido - processar cadastro
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }
}
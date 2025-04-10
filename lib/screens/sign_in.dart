import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    const fieldColor = Color(0xFFF7EBF0); // Lilás suave

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cat_icon.png', height: 200),

            const SizedBox(height: 16),
            const Text(
              'Bem vindo. . .',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC793CF),
              ),
            ),

            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: fieldColor,
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.purple),
                hintText: 'Email ou Telefone',
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

            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: fieldColor,
                prefixIcon: const Icon(Icons.password_sharp, color: Colors.purple),
                hintText: 'Senha',
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

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC793CF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Divider(),
            const Text("or sign in with"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.g_mobiledata, size: 40, color: Colors.red),
                SizedBox(width: 10),
                Icon(Icons.alternate_email, size: 30, color: Colors.lightBlue),
                SizedBox(width: 10),
                Icon(Icons.facebook, size: 30, color: Colors.blue),
              ],
            ),

            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpPage()),
                );
              },
              child: const Text("Don't have an account? Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}

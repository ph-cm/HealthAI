import 'package:flutter/material.dart';
import './screens/home_page.dart';
import './screens/atividade_descricao.dart';
import './screens/atividade_respiracao.dart';
import './screens/splash_page.dart';
import './screens/sign_in.dart';
import './screens/sign_up.dart';
import './screens/video_call_page.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application_Health_AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFFFFEF6),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/': (context) => const HomePage(),
        '/atividade-descricao': (context) => const AtividadeDescricaoPage(),
        '/atividade-respiracao': (context) => const TelaRespiracao(),
        '/video-chamada': (context) => const VideoCallPage(),
      }
        );
      }

    }

    


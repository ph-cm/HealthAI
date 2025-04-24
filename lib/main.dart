import 'package:flutter/material.dart';
import './screens/home_page.dart';
import './screens/atividade_descricao.dart';
import './screens/atividade_respiracao.dart';
import './screens/splash_page.dart';
import './screens/sign_in.dart';
import './screens/sign_up.dart';
import './screens/video_call_page.dart';
import './screens/calendario_historico_page.dart';
import './screens/emocao_selecao.dart';
import './screens/emocao_reflexao.dart';
import './screens/emocao_feedback.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health AI',
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
        '/calendario': (context) => const CalendarioHistoricoPage(),
        '/emocao-selecao': (context) => const EmotionSelectionScreen(),
      },
      onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/emocao-reflexao':
              final emocao = settings.arguments as String;
              return MaterialPageRoute(
                builder: (context) => EmocaoReflexaoScreen(emocao: emocao),
              );

          case '/emocao-feedback':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => FeedbackDiarioScreen(
                emocao: args['emocao'],
                motivo: args['motivo'],
              ),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
        }
      },
    );
  }
}
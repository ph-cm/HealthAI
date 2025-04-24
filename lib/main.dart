import 'package:flutter/material.dart';
import './screens/home_page.dart';
import './screens/atividade_descricao.dart';
import './screens/atividade_respiracao.dart';
import './screens/splash_page.dart';
import './screens/sign_in.dart';
import './screens/sign_up.dart';
import './screens/video_call_page.dart';
import './screens/calendario_historico_page.dart'; // ⬅️ Novo import
import './screens/emocao_selecao.dart';
import './screens/emocao_intensidade.dart';
import './screens/emocao_reflexao.dart';
import './screens/emocao_grafico.dart';

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
        '/calendario': (context) => const CalendarioHistoricoPage(),
        '/emocao-selecao': (context) => const EmotionSelectionScreen(),
      },
      // In your main.dart, update the onGenerateRoute:
onGenerateRoute: (settings) {
  switch (settings.name) {
    case '/emocao-intensidade':
      final emocao = settings.arguments as String; 
      return MaterialPageRoute(
        builder: (context) => EmocaoIntensidadeScreen(emocao: emocao),
      );

    case '/emocao-reflexao':
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => EmocaoReflexaoScreen(
          emocao: args['emocao'],
          intensidade: args['intensidade'],
        ),
      );

          case '/emocao-grafico':
            final args = settings.arguments as Map<String, dynamic>? ?? {};
            return MaterialPageRoute(
              builder: (context) => EmocaoGraficoScreen(
                emocao: List<String>.from(args['emocao'] ?? []),
                intensidade: List<int>.from((args['intensidade'] as List<dynamic>?)?.map((e) => e as int) ?? []),
              ),
            );

          default:
            return null;
        }
      },

    );
  }
}

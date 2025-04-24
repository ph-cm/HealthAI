import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EmocaoGraficoScreen extends StatelessWidget {
  final List<String> emocao;
  final List<int> intensidade;

  const EmocaoGraficoScreen({
    Key? key,
    required this.emocao,
    required this.intensidade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Prepare valid chart data
    final chartData = _prepareChartData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico de Emoções'),
        centerTitle: true,
      ),
      body: chartData.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma emoção registrada.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceBetween,
                        barTouchData: BarTouchData(
                          enabled: true,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.purple.withOpacity(0.8),
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              return BarTooltipItem(
                                '${emocao[group.x.toInt()]}\nIntensidade: ${rod.toY.toInt()}',
                                const TextStyle(color: Colors.white),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              reservedSize: 30,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final index = value.toInt();
                                if (index >= 0 && index < emocao.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      emocao[index],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                              reservedSize: 40,
                            ),
                          ),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: true),
                        barGroups: chartData.map((data) {
                          return BarChartGroupData(
                            x: data['index'],
                            barRods: [
                              BarChartRodData(
                                toY: data['intensidade'].toDouble(),
                                color: _getColorForEmotion(data['emocao']),
                                width: 22,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                            showingTooltipIndicators: [0],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Seu histórico emocional',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }

  List<Map<String, dynamic>> _prepareChartData() {
    final List<Map<String, dynamic>> data = [];
    final minLength = emocao.length < intensidade.length ? emocao.length : intensidade.length;
    
    for (int i = 0; i < minLength; i++) {
      data.add({
        'index': i,
        'emocao': emocao[i],
        'intensidade': intensidade[i],
      });
    }
    return data;
  }

  Color _getColorForEmotion(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'feliz':
        return Colors.green;
      case 'triste':
        return Colors.blue;
      case 'bravo':
        return Colors.red;
      case 'ansioso':
        return Colors.orange;
      case 'calmo':
        return Colors.purple;
      default:
        return Colors.purple;
    }
  }
}
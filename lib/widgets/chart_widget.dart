import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/transaction.dart';

class ChartWidget extends StatelessWidget {

  final List<Transaction> transactions;

  const ChartWidget(this.transactions, {super.key});

  double get income {
    double total = 0;

    for (var t in transactions) {
      if (t.isIncome) {
        total += t.amount;
      }
    }

    return total;
  }

  double get expense {
    double total = 0;

    for (var t in transactions) {
      if (!t.isIncome) {
        total += t.amount;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Анализ доходов и расходов",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 200,
            child: BarChart(

              BarChartData(

                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),

                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,

                      getTitlesWidget: (value, meta) {

                        if (value == 0) {
                          return const Text("Доход");
                        }

                        if (value == 1) {
                          return const Text("Расход");
                        }

                        return const Text("");
                      },
                    ),
                  ),
                ),

                barGroups: [

                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: income,
                        width: 30,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ],
                  ),

                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: expense,
                        width: 30,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
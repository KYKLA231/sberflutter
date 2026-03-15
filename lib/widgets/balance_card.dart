import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {

  final Map<String, double> totalsByCurrency;

  const BalanceCard({super.key, required this.totalsByCurrency});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff1DB954),
            Color(0xff159A46)
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 18,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Баланс",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14
            ),
          ),

          const SizedBox(height: 8),

          for (final entry in totalsByCurrency.entries)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                '${entry.value.toStringAsFixed(2)} ${entry.key}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
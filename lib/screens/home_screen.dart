import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/finance_provider.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_list.dart';
import '../widgets/chart_widget.dart';
import 'add_transaction_screen.dart';


class HomeScreen extends StatelessWidget {
  final String? username;

  const HomeScreen({super.key, this.username});

  @override
  Widget build(BuildContext context) {
    final finance = Provider.of<FinanceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Финансовая аналитика"),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff22A447), Color(0xff159A46)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (username != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Text('Добро пожаловать, ${username!}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ],

          BalanceCard(totalsByCurrency: finance.totalsByCurrency),

          ChartWidget(finance.transactions),

          Expanded(
            child: TransactionList(finance.transactions),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff22A447),
        child: const Icon(Icons.add, size: 28),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddTransactionScreen(),
            ),
          );
        },
      ),
    );
  }
}
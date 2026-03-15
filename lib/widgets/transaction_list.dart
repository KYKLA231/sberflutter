import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  const TransactionList(this.transactions,{super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (_,i){

        final tx = transactions[i];

        final dateStr = DateFormat('dd.MM.yyyy').format(tx.date);
        final fmt = NumberFormat.simpleCurrency(name: tx.currency);

        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: tx.isIncome ? Colors.green[600] : Colors.red[600],
              child: Icon(
                tx.isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
            title: Text(tx.title, style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateStr),
                const SizedBox(height: 4),
                Text(tx.category.displayName, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
            trailing: Text(
              (tx.isIncome ? '+' : '-') + fmt.format(tx.amount),
              style: TextStyle(
                color: tx.isIncome ? Colors.green[700] : Colors.red[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
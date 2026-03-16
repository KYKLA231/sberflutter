import 'package:flutter/material.dart';
import '../models/transaction.dart';

class FinanceProvider extends ChangeNotifier {

  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void addTransaction(
    String title,
    double amount,
    bool income, {
    String currency = 'RUB',
    Category category = Category.other,
  }) {
    _transactions.add(
      Transaction(
        title: title,
        amount: amount,
        isIncome: income,
        date: DateTime.now(),
        currency: currency,
        category: category,
      ),
    );

    notifyListeners();
  }

  Map<String, double> get totalsByCurrency {
    final Map<String, double> map = {};
    for (var t in _transactions) {
      map[t.currency] = (map[t.currency] ?? 0) + (t.isIncome ? t.amount : -t.amount);
    }
    return map;
  }

  double get balance {
    double total = 0;
    for (var t in _transactions) {
      if (t.currency == 'RUB') {
        total += t.isIncome ? t.amount : -t.amount;
      }
    }
    return total;
  }
}
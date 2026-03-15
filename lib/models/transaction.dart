enum Category {
  transport,
  food,
  cafe,
  shops,
  pharmacy,
  other,
}

class Transaction {
  final String title;
  final double amount;
  final bool isIncome;
  final DateTime date;
  final String currency; 
  final Category category;

  Transaction({
    required this.title,
    required this.amount,
    required this.isIncome,
    required this.date,
    this.currency = 'RUB',
    this.category = Category.other,
  });
}

extension CategoryExt on Category {
  String get displayName {
    switch (this) {
      case Category.transport:
        return 'Транспорт';
      case Category.food:
        return 'Еда';
      case Category.cafe:
        return 'Кафе/Рестораны';
      case Category.shops:
        return 'Магазины';
      case Category.pharmacy:
        return 'Аптеки';
      case Category.other:
        return 'Другое';
    }
  }
}
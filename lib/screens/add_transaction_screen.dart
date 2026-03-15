import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/finance_provider.dart';
import '../models/transaction.dart';

class AddTransactionScreen extends StatefulWidget {

  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  bool isIncome = false;
  String selectedCurrency = 'RUB';
  Category selectedCategory = Category.other;

  void submit(){
    final text = titleController.text.trim();
    final amountText = amountController.text.trim();
    if (text.isEmpty || amountText.isEmpty) return;

    final value = double.tryParse(amountText.replaceAll(',', '.')) ?? 0;

    Provider.of<FinanceProvider>(
      context,
      listen: false,
    ).addTransaction(
      text,
      value,
      isIncome,
      currency: selectedCurrency,
      category: selectedCategory,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
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
        title: Text(
          "Добавить операцию",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Название",
              ),
            ),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Сумма",
              ),
            ),

            const SizedBox(height: 12),

            // Currency selection
            Row(
              children: [
                const Text('Валюта: '),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedCurrency,
                  items: const [
                    DropdownMenuItem(value: 'RUB', child: Text('RUB')),
                    DropdownMenuItem(value: 'USD', child: Text('USD')),
                    DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                  ],
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => selectedCurrency = v);
                  },
                ),
                const SizedBox(width: 20),
                const Text('Категория: '),
                const SizedBox(width: 8),
                DropdownButton<Category>(
                  value: selectedCategory,
                  items: Category.values.map((c) => DropdownMenuItem(value: c, child: Text(c.displayName))).toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => selectedCategory = v);
                  },
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isIncome ? Theme.of(context).colorScheme.primary : Colors.grey[200],
                        foregroundColor: isIncome ? Colors.white : Colors.black87,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () => setState(() => isIncome = true),
                      child: const Text('Доход'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isIncome ? Colors.red[600] : Colors.grey[200],
                        foregroundColor: !isIncome ? Colors.white : Colors.black87,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () => setState(() => isIncome = false),
                      child: const Text('Расход'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height:20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: submit,
                child: Text(
                  "Добавить",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseDetailScreen extends StatelessWidget {
  const ExpenseDetailScreen({
    super.key,
    required this.expense,
    required this.onRemoveExpense,
  });

  final Expense expense;
  final void Function(Expense expense) onRemoveExpense;

  Color get categoryColor {
    switch (expense.category) {
      case Category.food:
        return const Color(0xFFD97706);
      case Category.leisure:
        return const Color(0xFF7C3AED);
      case Category.travel:
        return const Color(0xFF0284C7);
      case Category.work:
        return const Color(0xFF059669);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(expense.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onRemoveExpense(expense);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: categoryColor.withAlpha(40),
                      child: Icon(
                        categoryIcons[expense.category],
                        color: categoryColor,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          expense.category.name.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: categoryColor,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$${expense.amount.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Date'),
              subtitle: Text(expense.formattedDate),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.label_outline),
              title: const Text('Transaction Title'),
              subtitle: Text(expense.title),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
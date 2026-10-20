import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/empty_expenses_state.dart';

class CategoryExpensesScreen extends StatelessWidget {
  const CategoryExpensesScreen({
    super.key,
    required this.category,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final Category category;
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    final categoryExpenses = expenses
        .where((expense) => expense.category == category)
        .toList();

    Widget content = const EmptyExpensesState();

    if (categoryExpenses.isNotEmpty) {
      content = ExpensesList(
        expenses: categoryExpenses,
        onRemoveExpense: onRemoveExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name.toUpperCase()} Expenses'),
      ),
      body: content,
    );
  }
}
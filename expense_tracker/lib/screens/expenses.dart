import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/empty_expenses_state.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';

class Expenses extends StatelessWidget {
  const Expenses({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const EmptyExpensesState();

    if (expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: expenses,
        onRemoveExpense: onRemoveExpense,
      );
    }

    return mainContent;
  }
}
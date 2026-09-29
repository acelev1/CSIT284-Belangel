import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expense_bucket.dart';
import 'package:expense_tracker/widgets/chart/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  // Calculate Grand Total of all expenses
  double get grandTotal {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }

  double get maxTotalExpense {
    double maxCategoryTotal = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxCategoryTotal) {
        maxCategoryTotal = bucket.totalExpenses;
      }
    }
    // Add 30% padding so bars don't clip at top
    return maxCategoryTotal == 0 ? 1 : maxCategoryTotal * 1.3;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 220, // Extended height to fit numbers and header
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
       gradient: LinearGradient(
          colors: [
         const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), // <-- Change your chart gradient color here
         const Color.fromARGB(255, 0, 0, 0).withOpacity(0.0),
       ],
         begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
    ),
      ),
      child: Column(
        children: [
          // Header displaying Total Expenses recorded
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Spending',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '\$${grandTotal.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Chart Bars displaying individual totals
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: maxTotalExpense == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                    amount: bucket.totalExpenses,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Category Icons Row
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Center(
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
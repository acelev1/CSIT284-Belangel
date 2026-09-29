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

  String getCategoryName(Category category) {
    switch (category) {
      case Category.food:
        return 'Food';
      case Category.leisure:
        return 'Leisure';
      case Category.travel:
        return 'Travel';
      case Category.work:
        return 'Work';
    }
  }

  // Soft, harmonious accent colors
  Color getCategoryColor(Category category) {
    switch (category) {
      case Category.food:
        return const Color(0xFFD97706); // Soft Warm Amber
      case Category.leisure:
        return const Color(0xFF7C3AED); // Modern Violet
      case Category.travel:
        return const Color(0xFF0284C7); // Muted Sky Blue
      case Category.work:
        return const Color(0xFF059669); // Sage Emerald
    }
  }

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
    return maxCategoryTotal == 0 ? 1 : maxCategoryTotal * 1.3;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Total Spending Inline Header
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total Spending: ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 4),
                Text(
                  '\$${grandTotal.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Scaled Bars
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
                      barColor: getCategoryColor(bucket.category),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Category Icons & Text Labels
            Row(
              children: buckets
                  .map(
                    (bucket) => Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            categoryIcons[bucket.category],
                            color: getCategoryColor(bucket.category),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            getCategoryName(bucket.category),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: isDarkMode
                                  ? Colors.white70
                                  : const Color(0xFF475569),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class EmptyExpensesState extends StatelessWidget {
  const EmptyExpensesState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outline.withAlpha(128),
          ),
          const SizedBox(height: 12),
          Text(
            'No expenses found. Start adding some!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
        ],
      ),
    );
  }
}
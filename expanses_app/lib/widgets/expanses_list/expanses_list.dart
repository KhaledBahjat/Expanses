import 'package:expanses_app/models/expense.dart';
import 'package:expanses_app/widgets/expanses_list/expanses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.rejesterex,
    required this.onRemoveExpanse,
  });

  final List<Expense> rejesterex;
  final void Function(Expense expense) onRemoveExpanse;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rejesterex.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(rejesterex[index].id),
        onDismissed: (dir) => onRemoveExpanse(rejesterex[index]),
        child: ExpansesItem(expense: rejesterex[index]),
      ),
    );
  }
}

import '../models/expense.dart';
import '../widgets/expanses_list/expanses_list.dart';
import '../widgets/new_expanse.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // ignore: unused_field
  final List<Expense> rejesterex = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Alex',
      amount: 200.69,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void addExpense(Expense enterdExpense) {
    setState(() {
      rejesterex.add(enterdExpense);
    });
  }

  void removeExpense(Expense removedExpense) {
    setState(() {
      rejesterex.remove(removedExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => NewExpanse(onAddExpanse: addExpense),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ExpensesList(
                rejesterex: rejesterex,
                onRemoveExpanse: removeExpense,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

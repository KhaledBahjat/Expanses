

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({super.key, required this.onAddExpanse});
  final void Function(Expense expense) onAddExpanse;
  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: "\$ ",
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "No Date Selected "
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final first = DateTime(
                          now.year - 1,
                          now.month,
                          now.day,
                        );

                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: first,
                          lastDate: now,
                        );
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      },
                      icon: Icon(Icons.calendar_month, size: 35),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (newCat) {
                  setState(() {
                    if (newCat == null) return;
                    _selectedCategory = newCat;
                  });
                },
              ),

              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  final double? enterdAmount = double.tryParse(
                    _amountController.text,
                  );
                  final bool amountIsInvalid =
                      enterdAmount == null || enterdAmount <= 0;

                  if (_titleController.text.trim().isEmpty ||
                      amountIsInvalid ||
                      _selectedDate == null) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Invalid Data"),
                        content: Text(
                          '''⚠️ Oops! Looks like you missed something.\n Please enter the title, amount, date, and category to continue''',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    widget.onAddExpanse(
                      Expense(
                        title: _titleController.text,
                        amount: enterdAmount,
                        date: _selectedDate!,
                        category: _selectedCategory,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save Expanse"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

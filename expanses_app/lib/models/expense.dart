import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uniqId = Uuid();
final dateFormmat = DateFormat.yMd();

enum Category {
  food,
  work,
  travel,
  leisure,
  bills,
  shopping,
  health,
  education,
  transport,
  entertainment,
  gifts,
  groceries,
  subscriptions,
  savings,
  donations,
  others,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.work: Icons.work,
  Category.travel: Icons.flight,
  Category.leisure: Icons.weekend,
  Category.bills: Icons.receipt_long,
  Category.shopping: Icons.shopping_bag,
  Category.health: Icons.health_and_safety,
  Category.education: Icons.school,
  Category.transport: Icons.directions_car,
  Category.entertainment: Icons.movie,
  Category.gifts: Icons.card_giftcard,
  Category.groceries: Icons.local_grocery_store,
  Category.subscriptions: Icons.subscriptions,
  Category.savings: Icons.savings,
  Category.donations: Icons.volunteer_activism,
  Category.others: Icons.category,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  //  To formated date
  String get formattedDate => dateFormmat.format(date);

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uniqId.v4();
}

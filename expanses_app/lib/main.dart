import 'package:expanses_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var myColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF3B60B3));
var myDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF3B60B3),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData().copyWith(
        colorScheme: myColorScheme,
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: myColorScheme.onSecondary,
        ),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 17,
          ),
        ),
      ),
      home: const Expenses(),
    );
  }
}

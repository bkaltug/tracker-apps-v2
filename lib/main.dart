import 'package:flutter/material.dart';
import './screens/food_page.dart';
import './screens/home_page.dart';
import './screens/money_page.dart';
import './screens/to_do_page.dart';
import './screens/water_page.dart';
import './screens/weight_page.dart';

import 'screens/notes_page.dart';

void main() {
  runApp(const TraccApp());
}

class TraccApp extends StatelessWidget {
  const TraccApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff702963)),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        "/To Do": (context) => const ToDoPage(),
        "/Notes": (context) => const NotesPage(),
        "/Food": (context) => const FoodPage(),
        "/Water": (context) => const WaterPage(),
        "/Weight": (context) => const WeightPage(),
        "/Money": (context) => const MoneyPage(),
      },
    );
  }
}

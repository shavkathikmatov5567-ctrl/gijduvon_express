import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const UzumTezkorCopyApp());
}

class UzumTezkorCopyApp extends StatelessWidget {
  const UzumTezkorCopyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gijduvon express',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7000FF)), // Uzum-нинг машҳур сиёҳранги
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

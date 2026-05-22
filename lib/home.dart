import 'package:flutter/material.dart';
import 'food.dart';
import 'cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Gijduvon express', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF7000FF), // Жозибадор сиёҳранг
        actions: [
          // ЖОНЛИ СҲОТЧИКЛИ САВАТЧА ИКОНКАСИ
          ValueListenableBuilder<List<Map<String, dynamic>>>(
            valueListenable: uzumCart,
            builder: (context, items, child) {
              int count = 0;
              for (var i in items) { count += i['count'] as int; }
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_basket, color: Colors.white),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage())),
                  ),
                  if (count > 0)
                    Positioned(
                      right: 4, top: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                        child: Text('$count', style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    )
                ],
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Нима етказиб берамиз? ⚡', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              // РЕСТОРАНЛАР (УЗУМ ТЕЗКОР СТИЛИДА)
              _buildUzumTile(context, 'Ресторанлар ва Кафелар', 'Ғиждувон шашликлари, ош ва миллий таомлар', const FoodMenuPage()),
              const SizedBox(height: 12),
              _buildUzumTile(context, 'Маҳсулотлар (Маркет)', 'Кундалик озиқ-овқат маҳсулотлари', null),
              const SizedBox(height: 12),
              _buildUzumTile(context, 'Дорихоналар', 'Тезкор тиббий дори-дармонлар', null),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUzumTile(BuildContext context, String title, String subtitle, Widget? page) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title тез кунда ишга тушади!')),
          );
        }
      },
    );
  }
}

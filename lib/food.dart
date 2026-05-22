import 'package:flutter/material.dart';
import 'cart.dart'; // Саватча базасини улаймиз

class FoodMenuPage extends StatelessWidget {
  const FoodMenuPage({super.key});

  void _add(BuildContext context, String name, int price) {
    List<Map<String, dynamic>> current = List.from(uzumCart.value);
    int index = current.indexWhere((item) => item['name'] == name);

    if (index >= 0) {
      current[index]['count'] += 1;
    } else {
      current.add({"name": name, "price": price, "count": 1});
    }

    uzumCart.value = current;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name саватчага қўшилди! 🛒'), duration: const Duration(milliseconds: 500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menu = [
      {"name": "Ғиждувон шашлик (Қийма)", "price": 18000, "desc": "Ҳақиқий Ғиждувонча машҳур шашлик"},
      {"name": "Тўй Палови (Махсус)", "price": 25000, "desc": "Зиғир ёғли, сергўшт ош"},
      {"name": "Тандир сомса", "price": 10000, "desc": "Духовкада эмас, ҳақиқий тандирда"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Миллий таомлар', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF7000FF),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          final dish = menu[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(dish['name'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${dish['desc']}\n${dish['price']} сўм'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7000FF), foregroundColor: Colors.white),
                onPressed: () => _add(context, dish['name'].toString(), dish['price'] as int),
                child: const Text('Қўшиш'),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Узум Тезкор Саватча Базаси (Жонли хотира)
final ValueNotifier<List<Map<String, dynamic>>> uzumCart = ValueNotifier([]);

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Саватча', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF7000FF), // Uzum сиёҳранги
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: uzumCart,
        builder: (context, items, child) {
          if (items.isEmpty) {
            return const Center(
              child: Text('Саватчангиз ҳозирча бўш 🛒', style: TextStyle(fontSize: 16, color: Colors.grey)),
            );
          }

          int total = 0;
          for (var item in items) {
            total += (item['price'] as int) * (item['count'] as int);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    int itemTotal = (item['price'] as int) * (item['count'] as int);
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: ListTile(
                        title: Text(item['name'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${item['count']} дона x ${item['price']} сўм'),
                        trailing: Text('$itemTotal сўм', style: const TextStyle(color: Color(0xFF7000FF), fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Жами сумма:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('$total сўм', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7000FF))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7000FF), foregroundColor: Colors.white),
                        onPressed: () {
                          uzumCart.value = []; // Саватчани тозалаш
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Буюртма қабул қилинди! Курьер йўлга чиқди 🚖')),
                          );
                        },
                        child: const Text('Буюртма бериш', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

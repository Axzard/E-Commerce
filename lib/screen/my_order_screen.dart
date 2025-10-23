import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  int expandedIndex = -1; // untuk melacak order yang dibuka

  final List<Map<String, dynamic>> orders = [
    {
      "id": "#90897",
      "date": "October 19 2021",
      "items": 10,
      "price": 16.90,
      "status": "pending",
      "steps": [
        {"label": "Order placed", "date": "Oct 19 2021", "done": true},
        {"label": "Order confirmed", "date": "Oct 20 2021", "done": true},
        {"label": "Order shipped", "date": "Oct 20 2021", "done": true},
        {"label": "Out for delivery", "date": "pending", "done": false},
        {"label": "Order delivered", "date": "pending", "done": false},
      ],
    },
    {
      "id": "#90898",
      "date": "Aug 29 2021",
      "items": 10,
      "price": 16.90,
      "status": "delivered",
      "steps": [
        {"label": "Order placed", "date": "Aug 27 2021", "done": true},
        {"label": "Order confirmed", "date": "Aug 27 2021", "done": true},
        {"label": "Order shipped", "date": "Aug 28 2021", "done": true},
        {"label": "Out for delivery", "date": "Aug 29 2021", "done": true},
        {"label": "Order delivered", "date": "Aug 29 2021", "done": true},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Order",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Icon(Icons.tune_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      backgroundColor: const Color(0xFFF7F8F9),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final isExpanded = expandedIndex == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header Order
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9F8E5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Feather.box, color: Color(0xFF6CC51D)),
                  ),
                  title: Text(
                    "Order ${order['id']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Placed on ${order['date']}"),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              "Items: ${order['items']}",
                              style: const TextStyle(fontSize: 13),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "Items: \$${order['price']}",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: const Color(0xFF6CC51D),
                    ),
                    onPressed: () {
                      setState(() {
                        expandedIndex = isExpanded ? -1 : index;
                      });
                    },
                  ),
                ),

                // Expand Area
                if (isExpanded)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      children: order['steps']
                          .map<Widget>((step) => _buildOrderStep(step))
                          .toList(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrderStep(Map<String, dynamic> step) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: step['done'] ? const Color(0xFF6CC51D) : Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: 20,
              width: 2,
              color: Colors.grey[300],
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  step['label'],
                  style: TextStyle(
                    color: step['done']
                        ? Colors.black
                        : Colors.black.withOpacity(0.4),
                    fontWeight:
                        step['done'] ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                Text(
                  step['date'],
                  style: TextStyle(
                    color: step['done']
                        ? Colors.black
                        : Colors.black.withOpacity(0.4),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

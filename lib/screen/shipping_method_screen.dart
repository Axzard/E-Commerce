import 'package:flutter/material.dart';
import 'shipping_information_screen.dart'; // pastikan file ini ada

class ShippingMethodScreen extends StatefulWidget {
  const ShippingMethodScreen({Key? key}) : super(key: key);

  @override
  State<ShippingMethodScreen> createState() => _ShippingMethodScreenState();
}

class _ShippingMethodScreenState extends State<ShippingMethodScreen> {
  int selectedIndex = 0;
  int currentStep = 1;

  final List<Map<String, dynamic>> shippingOptions = [
    {
      'title': 'Standard Delivery',
      'description':
          'Order will be delivered between 3 - 4 business days straights to your doorstep.',
      'price': 3.0,
    },
    {
      'title': 'Next Day Delivery',
      'description':
          'Order will be delivered between 1 - 2 business days straights to your doorstep.',
      'price': 5.0,
    },
    {
      'title': 'Nominated Delivery',
      'description':
          'Order will be delivered between 3 - 4 business days straights to your doorstep.',
      'price': 3.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Shipping Method',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            _buildStepper(),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: shippingOptions.length,
                itemBuilder: (context, index) {
                  final option = shippingOptions[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF6CC51D)
                              : const Color(0xFFE5E5E5),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  option['title'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  option['description'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "\$${option['price'].toStringAsFixed(0)}",
                            style: const TextStyle(
                              color: Color(0xFF6CC51D),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShippingInformationScreen(),
                  ),
                );
              },

              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFAEDC81), Color(0xFF6CC51D)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStepCircle("1", "DELIVERY", currentStep >= 1),
        _buildLine(active: currentStep >= 2),
        _buildStepCircle("2", "ADDRESS", currentStep >= 2),
        _buildLine(active: currentStep >= 3),
        _buildStepCircle("3", "PAYMENT", currentStep >= 3),
      ],
    );
  }

  Widget _buildStepCircle(String number, String label, bool active) {
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: active
              ? const Color(0xFF6CC51D)
              : const Color(0xFFEAEAEA),
          child: Text(
            number,
            style: TextStyle(
              color: active ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: active ? Colors.black : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildLine({required bool active}) {
    return Container(
      width: 40,
      height: 2,
      color: active ? const Color(0xFF6CC51D) : const Color(0xFFEAEAEA),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double minPrice = 0;
  double maxPrice = 0;
  double rating = 4;
  bool discount = false;
  bool freeShipping = true;
  bool sameDay = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Apply Filters",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              setState(() {
                minPrice = 0;
                maxPrice = 0;
                rating = 4;
                discount = false;
                freeShipping = false;
                sameDay = false;
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Price Range
            _buildSectionTitle("Price Range"),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Min.",
                        filled: true,
                        fillColor: const Color(0xFFF7F7FB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      ),
                      onChanged: (value) {
                        minPrice = double.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Max.",
                        filled: true,
                        fillColor: const Color(0xFFF7F7FB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      ),
                      onChanged: (value) {
                        maxPrice = double.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Star Rating
            _buildSectionTitle("Star Rating"),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 28,
                    unratedColor: Colors.grey.shade300,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color(0xFFFFC107),
                    ),
                    onRatingUpdate: (newRating) {
                      setState(() {
                        rating = newRating;
                      });
                    },
                  ),
                  const Spacer(),
                  Text("${rating.toStringAsFixed(1)} stars",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Others
            _buildSectionTitle("Others"),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildOptionTile(Icons.local_offer_outlined, "Discount", discount, (val) {
                    setState(() => discount = val);
                  }),
                  _divider(),
                  _buildOptionTile(Icons.local_shipping_outlined, "Free shipping", freeShipping,
                      (val) {
                    setState(() => freeShipping = val);
                  }),
                  _divider(),
                  _buildOptionTile(Icons.delivery_dining_outlined, "Same day delivery", sameDay,
                      (val) {
                    setState(() => sameDay = val);
                  }),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // 🔹 Apply Filter Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFAEDC81), Color(0xFF6CC51D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Apply filter",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper widgets
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildOptionTile(
      IconData icon, String title, bool value, Function(bool) onChanged) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: Icon(icon, color: Colors.grey.shade700),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: IconButton(
        icon: Icon(
          value ? Icons.check_circle : Icons.circle_outlined,
          color: value ? const Color(0xFF6CC51D) : Colors.grey.shade400,
        ),
        onPressed: () => onChanged(!value),
      ),
    );
  }

  Widget _divider() => Divider(height: 1, color: Colors.grey.shade200);
}

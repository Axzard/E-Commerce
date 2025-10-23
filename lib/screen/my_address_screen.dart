import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/screen/add_address_screen.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  bool makeDefault = true;
  bool isExpanded = true; // 🔹 untuk buka/tutup form default address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'My Address',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddAddressScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        children: [
          // --- Address card with toggle ---
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Header row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFFFE9),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(Icons.home_outlined, color: Color(0xFF6CC51D), size: 28),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Russell Austin",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "2811 Crescent Day, LA Port\nCalifornia, United States 77571",
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  height: 1.4,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "+1 202 555 0142",
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Toggle icon (expand/collapse)
                        GestureDetector(
                          onTap: () {
                            setState(() => isExpanded = !isExpanded);
                          },
                          child: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: const Color(0xFF6CC51D),
                            size: 26,
                          ),
                        ),
                      ],
                    ),

                    // Expandable form section
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstChild: const SizedBox.shrink(),
                      secondChild: Column(
                        children: [
                          const SizedBox(height: 14),
                          const Divider(height: 1),
                          const SizedBox(height: 12),
                          _buildFilledField(icon: Icons.person_outline, hint: 'Name', value: 'Russell Austin'),
                          const SizedBox(height: 10),
                          _buildFilledField(
                            icon: Icons.location_on_outlined,
                            hint: 'Address',
                            value: '2811 Crescent Day, LA Port\nCalifornia, United States 77571',
                            maxLines: 2,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(child: _buildFilledField(icon: Icons.location_city, hint: 'City', value: 'Los Angeles')),
                              const SizedBox(width: 10),
                              Expanded(child: _buildFilledField(icon: Icons.pin_drop_outlined, hint: 'Zip code', value: '77571')),
                            ],
                          ),
                          const SizedBox(height: 10),
                          _buildFilledField(
                            icon: Icons.public,
                            hint: 'Country',
                            value: 'United States',
                            suffix: Icons.keyboard_arrow_down,
                          ),
                          const SizedBox(height: 10),
                          _buildFilledField(icon: Icons.phone_outlined, hint: 'Phone number', value: '+1 202 555 0142'),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Switch(
                                value: makeDefault,
                                activeColor: const Color(0xFF6CC51D),
                                onChanged: (v) => setState(() => makeDefault = v),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Make default',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                  ],
                ),
              ),

              // Label DEFAULT
              Positioned(
                top: 0,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F7E1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'DEFAULT',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF6CC51D),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // --- Secondary address card ---
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFFFE9),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.location_on, color: Color(0xFF6CC51D), size: 26),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jissca Simpson',
                        style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '2811 Crescent Day, LA Port\nCalifornia, United States 77571',
                        style: GoogleFonts.inter(fontSize: 13, color: Colors.black54, height: 1.3),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '+1 202 555 0142',
                        style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF6CC51D), size: 26),
              ],
            ),
          ),

          const SizedBox(height: 90),
        ],
      ),

      // Save settings button
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Address saved successfully!')),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFAEDC81), Color(0xFF6CC51D)]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Save settings',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilledField({
    required IconData icon,
    required String hint,
    String? value,
    int maxLines = 1,
    IconData? suffix,
  }) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: value),
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey.shade600),
        suffixIcon: suffix != null ? Icon(suffix, color: Colors.grey.shade600) : null,
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: Colors.grey.shade500),
        filled: true,
        fillColor: const Color(0xFFF2F3F5),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF6CC51D)),
        ),
      ),
    );
  }
}

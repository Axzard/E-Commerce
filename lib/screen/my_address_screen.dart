import 'package:flutter/material.dart';
import 'package:uts/screen/add_address_screen.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  bool makeDefault = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'My Address',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: () {
              // tambah alamat baru
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddAddressScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildDefaultAddressCard(),
            const SizedBox(height: 12),
            _buildAddressForm(),
            const SizedBox(height: 12),
            _buildSecondaryAddressCard(),
            const SizedBox(height: 24),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  // 🔹 Kartu alamat default
  Widget _buildDefaultAddressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label "DEFAULT"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF6CC51D).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'DEFAULT',
              style: TextStyle(
                color: Color(0xFF6CC51D),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Info alamat
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF6CC51D).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.location_on, color: Color(0xFF6CC51D)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Russell Austin",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "2811 Crescent Day, LA Port\nCalifornia, United States 77571",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "+1 202 555 0142",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.black54),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Formulir edit / tambah alamat
  Widget _buildAddressForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTextField(Icons.person_outline, "Name"),
          const SizedBox(height: 10),
          _buildTextField(Icons.location_on_outlined, "Address"),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildTextField(Icons.location_city, "City")),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(Icons.pin_drop_outlined, "Zip code"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTextField(Icons.public, "Country"),
          const SizedBox(height: 10),
          _buildTextField(Icons.phone_outlined, "Phone number"),
          const SizedBox(height: 10),
          Row(
            children: [
              Switch(
                value: makeDefault,
                activeColor: const Color(0xFF6CC51D),
                onChanged: (val) => setState(() => makeDefault = val),
              ),
              const Text(
                "Make default",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Kartu alamat kedua
  Widget _buildSecondaryAddressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF6CC51D).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.location_on, color: Color(0xFF6CC51D)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Jissca Simpson",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "2811 Crescent Day, LA Port\nCalifornia, United States 77571",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "+1 202 555 0142",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.expand_more, color: Colors.black54),
        ],
      ),
    );
  }

  // 🔹 Tombol Save Settings
  Widget _buildSaveButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Address saved successfully!')),
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
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Save settings",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // 🔹 Input field custom
  Widget _buildTextField(IconData icon, String hint) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey.shade600),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF6CC51D)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:uts/models/address_model.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  bool saveAddress = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  String? selectedCountry;

  final List<String> countries = [
    'Indonesia',
    'Malaysia',
    'Singapore',
    'Thailand',
    'Vietnam',
  ];

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
          "Add Address",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                controller: nameController,
                hintText: 'Name',
                icon: LucideIcons.user,
              ),
              _buildTextField(
                controller: emailController,
                hintText: 'Email address',
                icon: LucideIcons.mail,
                keyboardType: TextInputType.emailAddress,
              ),
              _buildTextField(
                controller: phoneController,
                hintText: 'Phone number',
                icon: LucideIcons.phone,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                controller: addressController,
                hintText: 'Address',
                icon: LucideIcons.mapPin,
              ),
              _buildTextField(
                controller: zipController,
                hintText: 'Zip code',
                icon: LucideIcons.hash,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                controller: cityController,
                hintText: 'City',
                icon: LucideIcons.map,
              ),
              _buildCountryDropdown(),
              const SizedBox(height: 12),
              // Save address switch
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Switch(
                    value: saveAddress,
                    activeColor: Colors.white,
                    activeTrackColor: Color(0xFF6CC51D),
                    onChanged: (value) {
                      setState(() {
                        saveAddress = value;
                      });
                    },
                  ),
                  const Text(
                    'Save this address',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 150),
              // Submit button
              Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFAEDC81), Color(0xFF6CC51D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newAddress = Address(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        phone: phoneController.text.trim(),
                        address: addressController.text.trim(),
                        city: cityController.text.trim(),
                        zipCode: zipController.text.trim(),
                        country: selectedCountry ?? '',
                        isDefault: saveAddress,
                      );

                      Navigator.pop(
                        context,
                        newAddress,
                      ); // ⬅️ kirim alamat ke MyAddressScreen
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Add address",
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
      ),
    );
  }

  // --- Helper Widgets ---
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey.shade600),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) =>
            (value == null || value.isEmpty) ? 'Please enter $hintText' : null,
      ),
    );
  }

  Widget _buildCountryDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: selectedCountry,
        decoration: InputDecoration(
          prefixIcon: Icon(LucideIcons.globe, color: Colors.grey.shade600),
          hintText: 'Country',
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        items: countries
            .map(
              (country) =>
                  DropdownMenuItem(value: country, child: Text(country)),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
          });
        },
        validator: (value) => value == null ? 'Please select a country' : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uts/screen/payment_method_screen.dart';

class ShippingInformationScreen extends StatefulWidget {
  const ShippingInformationScreen({Key? key}) : super(key: key);

  @override
  State<ShippingInformationScreen> createState() =>
      _ShippingInformationScreenState();
}

class _ShippingInformationScreenState extends State<ShippingInformationScreen> {
  bool saveAddress = true;

  int currentStep = 2; // Step kedua pada stepper

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  String? selectedCountry;

  final List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Indonesia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Shipping Information',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildStepper(),
              const SizedBox(height: 30),
              _buildTextField(Icons.person_outline, "Name", nameController),
              const SizedBox(height: 14),
              _buildTextField(Icons.email_outlined, "Email address", emailController),
              const SizedBox(height: 14),
              _buildTextField(Icons.phone_outlined, "Phone number", phoneController),
              const SizedBox(height: 14),
              _buildTextField(Icons.location_on_outlined, "Address", addressController),
              const SizedBox(height: 14),
              _buildTextField(Icons.markunread_mailbox_outlined, "Zip code", zipController),
              const SizedBox(height: 14),
              _buildTextField(Icons.map_outlined, "City", cityController),
              const SizedBox(height: 14),
              _buildDropdownField(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Switch(
                    value: saveAddress,
                    onChanged: (val) {
                      setState(() {
                        saveAddress = val;
                      });
                    },
                    activeColor: const Color(0xFF6CC51D),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Save this address",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 120),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PaymentMethodScreen()));
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
      ),
    );
  }

  // ✅ Stepper sekarang mendukung centang hijau untuk step 1
  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStepCircle("1", "DELIVERY", 1),
        _buildLine(active: currentStep >= 2),
        _buildStepCircle("2", "ADDRESS", 2),
        _buildLine(active: currentStep >= 3),
        _buildStepCircle("3", "PAYMENT", 3),
      ],
    );
  }

  // Perbaikan: step 1 muncul centang saat currentStep > 1
  Widget _buildStepCircle(String number, String label, int stepNumber) {
    final bool active = currentStep >= stepNumber;

    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor:
              active ? const Color(0xFF6CC51D) : const Color(0xFFEAEAEA),
          child: currentStep > stepNumber
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : Text(
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

  Widget _buildTextField(IconData icon, String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black54),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          icon: Icon(Icons.public_outlined, color: Colors.black54),
          border: InputBorder.none,
        ),
        hint: const Text(
          "Country",
          style: TextStyle(color: Colors.black45, fontSize: 14),
        ),
        value: selectedCountry,
        items: countries
            .map((country) => DropdownMenuItem(
                  value: country,
                  child: Text(country),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
          });
        },
      ),
    );
  }
}

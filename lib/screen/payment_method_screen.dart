import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool saveCard = true;
  int selectedMethod = 1; // 0=Paypal, 1=CreditCard, 2=ApplePay

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Payment Method",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Step indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStepCircle("1", "DELIVERY", true),
                _buildStepCircle("2", "ADDRESS", true),
                _buildStepCircle("3", "PAYMENT", true),
              ],
            ),
            const SizedBox(height: 24),

            // Payment method options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPaymentOption(
                  icon: Icons.account_balance_wallet_outlined,
                  label: "Paypal",
                  index: 0,
                ),
                _buildPaymentOption(
                  icon: Icons.credit_card,
                  label: "Credit Card",
                  index: 1,
                ),
                _buildPaymentOption(
                  icon: Icons.apple,
                  label: "Apple pay",
                  index: 2,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Credit card preview
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFAEDC81), Color(0xFF6CC51D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/mastercard.png',
                        width: 48,
                        height: 36,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "XXXX XXXX XXXX 8790",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CARD HOLDER",
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "RUSSELL AUSTIN",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EXPIRES",
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "01/22",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Form inputs
            _buildInputField(
              hint: "Name on the card",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 12),
            _buildInputField(
              hint: "Card number",
              icon: Icons.credit_card_outlined,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    hint: "Month / Year",
                    icon: Icons.date_range_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildInputField(
                    hint: "CVV",
                    icon: Icons.lock_outline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Save card toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Switch(
                  value: saveCard,
                  activeColor: const Color(0xFF6CC51D),
                  onChanged: (value) {
                    setState(() => saveCard = value);
                  },
                ),
                Text(
                  "Save this card",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Make a payment button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
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
                    child: Text(
                      "Make a payment",
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
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk step indicator
  Widget _buildStepCircle(String number, String label, bool active) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: active ? const Color(0xFF6CC51D) : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Helper Widget untuk pilihan metode pembayaran
  Widget _buildPaymentOption({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = selectedMethod == index;

    return GestureDetector(
      onTap: () => setState(() => selectedMethod = index),
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF6CC51D) : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF6CC51D)
                  : Colors.grey.shade600,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk TextField
  Widget _buildInputField({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey.shade600),
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF6CC51D), width: 1.5),
        ),
      ),
    );
  }
}

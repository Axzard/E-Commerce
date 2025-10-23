import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/models/credit_card_model.dart';
import 'package:uts/screen/add_card_screen.dart';

class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  int selectedCard = -1;

  // 🔹 List kartu dinamis
  List<CreditCardModel> cards = [
    CreditCardModel(
      cardHolderName: "Russell Austin",
      cardNumber: "XXXX XXXX XXXX 5678",
      expiryDate: "01/22",
      cvv: "908",
      isSaved: true,
      cardType: "Master Card",
      cardImage: "assets/card1.png",
      isDefault: true,
    ),
    CreditCardModel(
      cardHolderName: "Russell Austin",
      cardNumber: "XXXX XXXX XXXX 1234",
      expiryDate: "01/23",
      cvv: "909",
      isSaved: true,
      cardType: "Visa Card",
      cardImage: "assets/card2.png",
      isDefault: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "My Cards",
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: () async {
              final newCard = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddCardScreen()),
              );

              if (newCard != null && newCard is CreditCardModel) {
                setState(() {
                  cards.add(newCard);
                });
              }
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: cards.asMap().entries.map((entry) {
            int index = entry.key;
            CreditCardModel card = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildCardTile(index: index, card: card),
            );
          }).toList(),
        ),
      ),

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: SizedBox(
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
                  "Save settings",
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

  Widget _buildCardTile({required int index, required CreditCardModel card}) {
    bool expanded = selectedCard == index;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 10), // biar label gak ketutup
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header kartu
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(card.cardImage, width: 40, height: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card.cardType,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          card.cardNumber,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Expiry : ${card.expiryDate}     CVV : ${card.cvv}",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = expanded ? -1 : index;
                      });
                    },
                    child: Icon(
                      expanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: const Color(0xFF6CC51D),
                      size: 24,
                    ),
                  ),
                ],
              ),

              // --- Detail jika di-expand
              if (expanded) ...[
                const SizedBox(height: 16),
                _buildDisabledField(
                  icon: Icons.person_outline,
                  text: card.cardHolderName,
                ),
                const SizedBox(height: 10),
                _buildDisabledField(
                  icon: Icons.credit_card_outlined,
                  text: card.cardNumber,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildDisabledField(
                        icon: Icons.date_range_outlined,
                        text: card.expiryDate,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildDisabledField(
                        icon: Icons.lock_outline,
                        text: card.cvv,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Switch(
                      value: card.isDefault,
                      activeColor: const Color(0xFF6CC51D),
                      onChanged: (value) {
                        setState(() {
                          for (var c in cards) {
                            c.isDefault = false;
                          }
                          cards[index].isDefault = value;
                        });
                      },
                    ),
                    Text(
                      "Make default",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),

        // --- Label "DEFAULT" di pojok kiri atas
        if (card.isDefault)
          Positioned(
            top: 0,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F7E1),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(6),
                  topLeft: Radius.circular(6),
                ),
              ),
              child: Text(
                "DEFAULT",
                style: GoogleFonts.inter(
                  fontSize: 10,
                  color: const Color(0xFF6CC51D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }

  // --- Field non-editable
  Widget _buildDisabledField({required IconData icon, required String text}) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey.shade600),
        hintText: text,
        hintStyle: GoogleFonts.inter(color: Colors.grey.shade700, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}

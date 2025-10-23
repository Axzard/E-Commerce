import 'package:flutter/material.dart';
import 'package:uts/auth/login_auth.dart';
import 'package:uts/screen/about_me_screen.dart';
import 'package:uts/screen/my_address_screen.dart';
import 'package:uts/screen/my_card_screen.dart';
import 'package:uts/screen/my_order_screen.dart';
import 'package:uts/screen/notification_screen.dart';
import 'transaction_screen.dart'; // 🔹 Import halaman transaksi

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 🔹 Foto profil
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/olivia.png"),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(3),
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xFF6CC51D),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Nama & email
            const Text(
              "Olivia Austin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "oliviaaustin@gmail.com",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),

            // 🔹 Menu list
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(context, Icons.person_outline, "About me",
                  // 🔹 Koneksi ke AboutmeScreen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutMeScreen()),
                    );
                  },
                  ),
                  _buildMenuItem(context, Icons.shopping_bag_outlined, "My Orders",
                  // 🔹 Koneksi ke MyorderScreen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyOrderScreen()),
                    );
                  },
                  ),
                  _buildMenuItem(context, Icons.favorite_border, "My Favorites"),
                  _buildMenuItem(context, Icons.location_on_outlined, "My Address",
                  // 🔹 Koneksi ke MyAddressScreen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyAddressScreen()),
                    );
                  }),
                  _buildMenuItem(context, Icons.credit_card, "Credit Cards",
                  
                  // 🔹 Koneksi ke MyAddressScreen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyCardsScreen()),
                    );
                  },
                  ),
                  
                  // 🔹 Koneksi ke TransactionScreen
                  _buildMenuItem(context, Icons.receipt_long_outlined, "Transactions",
                      onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TransactionScreen()),
                    );
                  }),
                  
                  _buildMenuItem(context, Icons.notifications_none, "Notifications",
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationScreen()),
                    );
                  }),
                  _buildMenuItem(context, Icons.logout, "Sign out",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Widget menu item dengan fungsi onTap opsional
  Widget _buildMenuItem(BuildContext context, IconData icon, String title,
      {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF6CC51D),
              size: 22,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

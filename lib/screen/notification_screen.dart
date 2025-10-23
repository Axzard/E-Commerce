import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool allowNotification = true;
  bool emailNotification = false;
  bool orderNotification = false;
  bool generalNotification = true;

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
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildNotificationTile(
              title: "Allow Notifications",
              subtitle:
                  "Lorem ipsum dolor sit amet, consectetur sadi\npscing elitr, sed diam nonumy.",
              value: allowNotification,
              onChanged: (val) => setState(() => allowNotification = val),
            ),
            const SizedBox(height: 12),
            _buildNotificationTile(
              title: "Email Notifications",
              subtitle:
                  "Lorem ipsum dolor sit amet, consectetur sadi\npscing elitr, sed diam nonumy.",
              value: emailNotification,
              onChanged: (val) => setState(() => emailNotification = val),
            ),
            const SizedBox(height: 12),
            _buildNotificationTile(
              title: "Order Notifications",
              subtitle:
                  "Lorem ipsum dolor sit amet, consectetur sadi\npscing elitr, sed diam nonumy.",
              value: orderNotification,
              onChanged: (val) => setState(() => orderNotification = val),
            ),
            const SizedBox(height: 12),
            _buildNotificationTile(
              title: "General Notifications",
              subtitle:
                  "Lorem ipsum dolor sit amet, consectetur sadi\npscing elitr, sed diam nonumy.",
              value: generalNotification,
              onChanged: (val) => setState(() => generalNotification = val),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Settings saved successfully!'),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFAEDC81),
                      Color(0xFF6CC51D),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Save settings',
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

  Widget _buildNotificationTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
        trailing: Switch(
          value: value,
          activeColor: Colors.green,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

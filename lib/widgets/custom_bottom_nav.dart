import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 80),
          painter: BottomBarPainter(selectedIndex: selectedIndex),
        ),

        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                index: 1,
              ),
              _buildNavItem(
                icon: Icons.favorite_border,
                activeIcon: Icons.favorite,
                index: 2,
              ),
              _buildNavItem(
                icon: Icons.shopping_bag_outlined,
                activeIcon: Icons.shopping_bag,
                index: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(8),
        transform: Matrix4.translationValues(0, isSelected ? -20 : 0, 0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isSelected ? 60 : 40,
          height: isSelected ? 60 : 40,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFF6CC51D), Color(0xFF6CC51D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            shape: BoxShape.circle,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? Colors.white : Colors.grey.shade600,
            size: isSelected ? 30 : 26,
          ),
        ),
      ),
    );
  }
}

class BottomBarPainter extends CustomPainter {
  final int selectedIndex;

  BottomBarPainter({required this.selectedIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.03)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    final buttonWidth = size.width / 4.1;
    final selectedPosition = (selectedIndex * buttonWidth) + (buttonWidth / 1.9);

    canvas.drawPath(_createPath(size, selectedPosition), shadowPaint);

    canvas.drawPath(_createPath(size, selectedPosition), paint);
  }

  Path _createPath(Size size, double selectedPosition) {
    final path = Path();
    final curveRadius = 35.0;
    final curveDepth = 28.0;

    path.moveTo(0, 10);

    if (selectedIndex >= 0) {
      path.lineTo(selectedPosition - curveRadius - 8, 8);

      path.quadraticBezierTo(
        selectedPosition - curveRadius,
        10,
        selectedPosition - curveRadius + 10,
        10 - curveDepth + 10,
      );

      path.quadraticBezierTo(
        selectedPosition,
        10 - curveDepth - 10,
        selectedPosition + curveRadius - 10,
        10 - curveDepth + 10,
      );

      path.quadraticBezierTo(
        selectedPosition + curveRadius,
        10,
        selectedPosition + curveRadius + 20,
        10,
      );
    }

    path.lineTo(size.width, 10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(BottomBarPainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}

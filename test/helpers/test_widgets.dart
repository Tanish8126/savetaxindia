import 'package:flutter/material.dart';

// Test-specific Categories widget that doesn't use Firebase
class TestCategories extends StatelessWidget {
  const TestCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.explore, color: Colors.green.shade700, size: 24),
              const SizedBox(width: 8),
              Text(
                "What You're Looking For?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  _buildCategoryCard(Icons.file_present_outlined, "File ITR"),
                  _buildCategoryCard(Icons.file_present_outlined, "Discussion"),
                  _buildCategoryCard(Icons.file_present_outlined, "Resources"),
                  _buildCategoryCard(Icons.file_present_outlined, "Expert"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Divider(thickness: 1, color: Colors.green.shade100),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.green.shade700),
          const SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.green.shade700),
          ),
        ],
      ),
    );
  }
}

// Test-specific HomeBody that doesn't include Categories widget
class TestHomeBody extends StatelessWidget {
  const TestHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(icon: Icons.grid_view_rounded, onTap: () {}),
                _circleButton(
                  icon: Icons.notifications_none_rounded,
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Discount Banner placeholder
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Discount Banner')),
          ),
          const SizedBox(height: 16),
          // Categories placeholder
          Container(
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Categories')),
          ),
          const SizedBox(height: 16),
          // Prompt Field placeholder
          Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Prompt Field')),
          ),
        ],
      ),
    );
  }

  Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Icon(icon, size: 22, color: Colors.black.withValues(alpha: 0.8)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RefundOptionsScreen extends StatelessWidget {
  static const String routeName = '/refund-options';
  const RefundOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //const Color primaryGreen = Color(0xFF2E8B57);
    const Color lightGreen = Color(0xFFEAF7F0);
    // const Color cardColor = Colors.white;

    return Scaffold(
      backgroundColor: lightGreen,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            // Refund Card with Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: _refundCard(),
            ),
            const SizedBox(height: 24),
            // Invest your refund
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Invest your refund",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Options
            _optionTile(
              icon: Icons.account_balance_rounded,
              text: "Deposit into my ABC Checking Account",
              onTap: () {},
            ),
            _optionTile(
              icon: Icons.account_balance_wallet_rounded,
              text: "Invest in my ABC Robo Account",
              onTap: () {},
            ),
            _optionTile(
              icon: Icons.receipt_long_rounded,
              text: "Pay bills",
              onTap: () {},
            ),
            _optionTile(
              icon: Icons.more_horiz_rounded,
              text: "Other",
              onTap: () {},
            ),
            const Spacer(),
            // Bottom Navigation Bar
            _bottomNavBar(),
          ],
        ),
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
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, size: 22, color: Colors.black87),
      ),
    );
  }

  Widget _refundCard() {
    const Color primaryGreen = Color(0xFF2E8B57);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryGreen.withAlpha((255 * 0.95).toInt()),
            primaryGreen.withAlpha((255 * 0.7).toInt()),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: primaryGreen.withAlpha((255 * 0.18).toInt()),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        children: [
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _tabButton("Federal refund", true),
              const SizedBox(width: 8),
              _tabButton("State refund", false),
            ],
          ),
          const SizedBox(height: 16),
          // Amount
          Text(
            "\$ 3.850",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 36,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton(String text, bool selected) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Color(0xFF2E8B57) : Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _optionTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEAF7F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(icon, color: Color(0xFF2E8B57), size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navIcon(Icons.home_rounded, true),
          _navIcon(Icons.account_balance_wallet_rounded, false),
          _navIcon(Icons.pie_chart_rounded, false),
          _navIcon(Icons.more_horiz_rounded, false),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, bool selected) {
    return Icon(
      icon,
      color: selected ? Color(0xFF2E8B57) : Colors.grey.shade400,
      size: 30,
    );
  }
}

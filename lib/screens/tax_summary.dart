import 'package:flutter/material.dart';

class TaxSummaryScreen extends StatefulWidget {
  static String routeName = './tax_summary.dart';
  const TaxSummaryScreen({super.key});

  @override
  State<TaxSummaryScreen> createState() => _TaxSummaryScreenState();
}

class _TaxSummaryScreenState extends State<TaxSummaryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Colors
    const Color primaryGreen = Color(0xFF2E8B57);
    const Color lightGreen = Color(0xFFEAF7F0);
    // const Color cardColor = Colors.white;
    // const double cardRadius = 16.0;

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
                  _circleButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () {},
                  ),
                  // const Text(
                  //   "6 of 7",
                  //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  // ),
                  // _circleButton(icon: Icons.close, onTap: () {}),
                ],
              ),
            ),
            // TabBar for regimes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TabBar(
                controller: _tabController,
                labelColor: primaryGreen,
                unselectedLabelColor: Colors.grey,
                indicatorColor: primaryGreen,
                tabs: const [
                  Tab(text: 'New Tax Regime'),
                  Tab(text: 'Old Tax Regime'),
                ],
              ),
            ),
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LinearProgressIndicator(
                value: 6 / 7,
                backgroundColor: Colors.grey.shade300,
                color: primaryGreen,
                minHeight: 4,
              ),
            ),
            const SizedBox(height: 24),
            // Info text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "We've automatically pre-filled your tax return\nwith the information below:",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
              ),
            ),
            const SizedBox(height: 24),
            // TabBarView for regime-specific content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _regimeSummaryContent(primaryGreen), // New Tax Regime
                  _regimeSummaryContent(primaryGreen), // Old Tax Regime
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _regimeSummaryContent(Color primaryGreen) {
    return Column(
      children: [
        // Cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _infoCard(
                title: "Wages & Income",
                amount: "72.144",
                onEdit: () {},
                onAdd: () {},
              ),
              const SizedBox(height: 16),
              _infoCard(
                title: "Credits & Deductions",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Refund
        Text(
          "Current Refund",
          style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          "\$ 3.850",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: primaryGreen,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            "If you have no other income or deductions to add, answer a few more questions and you'll be all set!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
        ),
        const Spacer(),
        // Next button
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: primaryGreen,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryGreen.withAlpha((255 * 0.2).toInt()),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(18),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper for top bar buttons
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
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 20, color: Colors.black87),
      ),
    );
  }

  // Helper for info cards
  Widget _infoCard({
    required String title,
    required String amount,
    required VoidCallback onEdit,
    required VoidCallback onAdd,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  "\$ $amount",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.green.shade700),
            onPressed: onEdit,
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: onAdd,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(40, 48),
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}

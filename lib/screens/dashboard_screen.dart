import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  String _selectedFilter = 'All';

  // Design Colors
  final _primaryColor = const Color(0xFF0DF2B5);
  final _backgroundColor = const Color(0xFF10221D);
  final _surfaceDark = const Color(0xFF1A3832);
  final _secondaryText = const Color(0xFF90CBBB);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0), // p-6 in Tailwind is usually 1.5rem (24px)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Card: Monthly Spending
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: _surfaceDark,
                  borderRadius: BorderRadius.circular(16.0), // rounded-2xl
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(13, 242, 181, 0.15),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Spending (October)',
                      style: TextStyle(
                        color: _secondaryText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      '\$3,450.20',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0, // text-4xl is 36px/40px
                        fontWeight: FontWeight.w900, // font-extrabold
                        letterSpacing: -1.0, // tracking-tight
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: _primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.trending_up,
                                color: _primaryColor,
                                size: 16.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                '+12%',
                                style: TextStyle(
                                  color: _primaryColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0), // gap-4
                        Text(
                          'vs last month',
                          style: TextStyle(
                            color: _secondaryText,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),

              // Quick Actions / Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['All', 'Food', 'Office', 'Travel'].map((filter) {
                    final isSelected = _selectedFilter == filter;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      child: Container(
                        height: 36.0, // h-9
                        margin: const EdgeInsets.only(right: 12.0), // gap-3
                        padding: const EdgeInsets.symmetric(horizontal: 20.0), // px-5
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? _primaryColor : _surfaceDark,
                          borderRadius: BorderRadius.circular(999), // rounded-full
                          border: isSelected ? null : Border.all(color: Colors.white.withOpacity(0.05)),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isSelected ? _backgroundColor : _secondaryText,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 14.0, // text-sm
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24.0), // space between sections

              // Recent Transactions List
              // Assuming a header is nice to have, but sticking to design structure mainly.
              // Design ref "Recent Transactions List" section comment.
              // But the HTML doesn't show a header text, just the list item.
              // I will not add a header text to stick to the visual HTML reference unless implied.
              // However, the previous code had it. The prompt says "translate the following HTML...".
              // I will leave out the header "Recent Transactions" text to be safe with "exact design spec".
              // But I will add a few items to show the list.

              Column(
                children: [
                  _buildTransactionItem('Office Depot', 'Office Supplies • Today, 10:23 AM', '-\$124.50'),
                  const SizedBox(height: 8.0), // gap-2
                  _buildTransactionItem('Starbucks', 'Food • Today, 08:45 AM', '-\$5.50'),
                  const SizedBox(height: 8.0),
                  _buildTransactionItem('Uber', 'Travel • Yesterday, 6:30 PM', '-\$12.25'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _primaryColor,
        unselectedItemColor: Colors.grey, // Standard unselected color
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String subtitle, String amount) {
    // HTML: bg-surface-dark/50 hover:bg-surface-dark p-3 rounded-xl transition-all border border-transparent hover:border-white/5 cursor-pointer
    return Container(
      padding: const EdgeInsets.all(12.0), // p-3
      decoration: BoxDecoration(
        color: _surfaceDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0), // rounded-xl
        border: Border.all(color: Colors.transparent), // Placeholder for border structure
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 48.0, // size-12 (3rem = 48px)
            height: 48.0,
            decoration: BoxDecoration(
              color: _surfaceDark,
              borderRadius: BorderRadius.circular(12.0), // rounded-xl
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.store, // material symbol 'store'
              color: _primaryColor,
              size: 24.0,
            ),
          ),
          const SizedBox(width: 16.0), // gap-4

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0, // text-base
                    fontWeight: FontWeight.w600, // font-semibold
                  ),
                  overflow: TextOverflow.ellipsis, // truncate
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: _secondaryText,
                    fontSize: 12.0, // text-xs
                  ),
                  overflow: TextOverflow.ellipsis, // truncate
                ),
              ],
            ),
          ),

          // Amount
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0, // text-base
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

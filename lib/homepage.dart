import 'package:eclipse_ecommerce_app/account.dart';
import 'package:eclipse_ecommerce_app/home.dart';
import 'package:eclipse_ecommerce_app/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  var pages = [const OrderPage(), const Home(), const AccountPage()];

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xff222222),
        child: Container(
          padding: EdgeInsets.only(top: 2.h, left: 2.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: Color(0xff3797C9),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xff3C3C3C), // Navigation bar
          statusBarColor: Color(0xff3C3C3C), // Status bar
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: const Icon(Icons.shop))
        ],
        foregroundColor: const Color(0xff3797C9),
        centerTitle: true,
        title: const Text(
          'Eclipse',
          style: TextStyle(fontFamily: 'Raleway-SemiBold'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 9.h),
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(color: Color(0xff161616)),
        // color: const Color(0xff222222),
        child: Column(
          children: [
            SizedBox(height: 74.h, child: pages[_selectedIndex]),
            SizedBox(
              height: 10.h,
              child: CurvedBottomNavigationBarContainer(
                selectedIndex: _selectedIndex,
                onTabChanged: _onItemTapped,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurvedBottomNavigationBarContainer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const CurvedBottomNavigationBarContainer({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Transform.translate(
            offset: Offset(0, 2.5.h), // Adjust the margin as needed
            child: BottomNavItem(
                icon: Icons.list_alt_outlined,
                label: '',
                isSelected: selectedIndex == 0,
                onTap: () => onTabChanged(0)),
          ),
          Transform.translate(
            offset: Offset(0, 1.h), // Adjust the margin as needed
            child: BottomNavItem(
              icon: Icons.home,
              label: '',
              isSelected: selectedIndex == 1,
              onTap: () => onTabChanged(1),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 2.5.h), // Adjust the margin as needed
            child: BottomNavItem(
              icon: Icons.person_outline,
              label: '',
              isSelected: selectedIndex == 2,
              onTap: () => onTabChanged(2),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double avatarRadius = isSelected ? 8.w : 6.w;

    return GestureDetector(
      onTap: onTap,
      child: Material(
        shadowColor: isSelected
            ? const Color.fromARGB(66, 86, 123, 243)
            : const Color.fromARGB(66, 46, 46, 46),
        elevation: 2.w, // Adjust the elevation to set the shadow effect
        shape: const CircleBorder(),
        child: CircleAvatar(
          radius: avatarRadius,
          backgroundColor:
              isSelected ? const Color(0xff3797C9) : const Color(0xffFFFFFF),
          child: Icon(
            size: isSelected ? 8.w : 6.w,
            icon,
            color: isSelected ? Colors.white : const Color(0xff3797C9),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholarship_app/utils/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scholarship_app/screens/login_page.dart';
import 'package:scholarship_app/screens/search_screen.dart';
import 'package:scholarship_app/screens/profile_screen.dart';
import 'package:scholarship_app/screens/home_dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = [
    const HomeDashboard(),
    const SearchScreen(),
    const LoginPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 2,
          selectedItemColor: const Color(0xFF3980F5),
          unselectedItemColor: AppColors.primaryText,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_normal),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.login),
              label: 'Log In',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

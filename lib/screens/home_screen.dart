
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholarship_app/utils/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/screens/login_page.dart';
import 'package:scholarship_app/screens/search_screen.dart';
import 'package:scholarship_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = [
    _buildHomeContent(),
    const SearchScreen(),
    const LoginPage(),
    const ProfileScreen(),
  ];

  Widget _buildHomeContent() {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Welcome to your Scholarship Hub!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.darkBackground,
        systemNavigationBarColor: AppColors.darkBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: SafeArea(
          child: _screens[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.cardBackground,
          elevation: 0.5,
          selectedItemColor: AppColors.contentColorBlue,
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

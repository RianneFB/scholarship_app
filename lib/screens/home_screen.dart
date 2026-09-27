import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholarship_app/utils/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.darkBackground,
        systemNavigationBarColor: AppColors.darkBackground,
        systemNavigationBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(), 
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.cardBackground,
          elevation: 0.5, 
          selectedItemColor: AppColors.contentColorBlue, 
          unselectedItemColor: AppColors.primaryText, 
          showUnselectedLabels: true, 
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home), 
              label: 'Home', 
              backgroundColor: AppColors.navBarBackground,
            ),
            BottomNavigationBarItem(icon: Icon(Iconsax.card), label: 'Card'),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.graph), 
              label: 'Analytics'
            ),
            BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}
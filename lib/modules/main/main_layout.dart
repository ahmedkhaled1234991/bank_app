import 'package:flutter/material.dart';

import '../../core/theming/app_colors.dart';
import '../../core/widgets/bottom_navigation_bar_widget.dart';
import '../chat/ui/chat_screen.dart';
import '../home/ui/home_screen.dart';
import '../investment/ui/investment_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    const InvestmentScreen(),
    const ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ));
  }
}

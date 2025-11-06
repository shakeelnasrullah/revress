import "package:flutter/material.dart";
import 'package:circle_nav_bar/circle_nav_bar.dart.';
import 'package:revress/app_colors.dart';
import 'package:revress/dashboard/home/home_screen.dart';
import 'package:revress/inspection/new_appointment_screen.dart';

import '../inspection/user_detail/dummy_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  set tabIndex(int value) {
    setState(() {
      _tabIndex = value;
    });
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNavigationBar(),
      body: pageView(),
    );
  }

  // Bottom Navigation Bar
  Widget bottomNavigationBar() {
    return CircleNavBar(
      levels: [],
      activeIcons: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/home.png",
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/calendar.png",
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/discount.png",
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/profile.png",
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
      ],
      inactiveIcons: [
        Text(
          "Home",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          "Schedule",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          "Offers",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
      color: AppColors.background,
      height: 60,
      circleWidth: 60,
      activeIndex: tabIndex,
      onTap: (index) {
        tabIndex = index;
        pageController.jumpToPage(tabIndex);
      },
      //padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
      ),
      shadowColor: AppColors.secondary,
      elevation: 10,
    );
  }

  // Page View
  Widget pageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        tabIndex = index;
      },
      children: [
        HomeScreen(),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: NewAppointmentScreen(),
        ),

        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: DummyView(),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(child: Text("Profile Screen", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
        ),
      ],
    );
  }

}

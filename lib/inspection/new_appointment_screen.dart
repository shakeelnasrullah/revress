

// screens/tab_screen.dart
import 'package:flutter/material.dart';
import 'package:revress/inspection/custom_tab_bar.dart';
import 'package:revress/inspection/tab_status.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  State<NewAppointmentScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<NewAppointmentScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  final List<CustomTab> _tabs = [
    CustomTab(
      title: 'Inspection Type',
      icon: "assets/images/checked_tab.png",
      status: TabStatus.completed,
      index: 0,
    ),
    CustomTab(
      title: 'Owner/Seller',
      icon: "assets/images/active_tab.png",
      status: TabStatus.active,
      index: 1,
    ),
    CustomTab(
      title: 'Payment',
      icon: "assets/images/default_tab.png",
      status: TabStatus.pending,
      index: 2,
    ),
    CustomTab(
      title: 'Review',
      icon: "assets/images/default_tab.png",
      status: TabStatus.pending,
      index: 3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;

      // Update tab statuses based on navigation
      for (int i = 0; i < _tabs.length; i++) {
        if (i < index) {
          _tabs[i] = CustomTab(
            title: _tabs[i].title,
            icon: _tabs[i].icon,
            status: TabStatus.completed,
            index: i,
          );
        } else if (i == index) {
          _tabs[i] = CustomTab(
            title: _tabs[i].title,
            icon: _tabs[i].icon,
            status: TabStatus.active,
            index: i,
          );
        } else {
          _tabs[i] = CustomTab(
            title: _tabs[i].title,
            icon: _tabs[i].icon,
            status: TabStatus.pending,
            index: i,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Tab Bar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: CustomTabBar(
        tabs: _tabs,
        currentIndex: _currentIndex,
        onTabChanged: _onTabChanged,
        pageController: _pageController,
      ),
    );
  }
}
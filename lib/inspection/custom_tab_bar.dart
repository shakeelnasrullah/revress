// widgets/custom_tab_bar.dart
import 'package:flutter/material.dart';
import 'package:revress/inspection/payment/payment_screen.dart';
import 'package:revress/inspection/receipt/receipt_screen.dart';
import 'package:revress/inspection/tab_status.dart';

import 'package:revress/inspection/type/inspection_type.dart';
import 'package:revress/inspection/user_detail/dummy_view.dart';
import 'package:revress/inspection/user_detail/user_detail_screen.dart';
import 'package:revress/inspection/vehicle_detail/vehicle_detail_screen.dart';
import 'package:revress/inspection/vehicle_type/vechicle_type_screen.dart';
import 'body_type/body_type_screen.dart';
import 'custom_tab_widget.dart';

class CustomTabBar extends StatelessWidget {
  final List<CustomTab> tabs;
  final int currentIndex;
  final ValueChanged<int> onTabChanged;
  final PageController pageController;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.currentIndex,
    required this.onTabChanged,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar - Horizontally scrollable with SingleChildScrollView
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  tabs.map((tab) {
                    return CustomTabWidget(
                      tab: tab,
                      isActive: currentIndex == tab.index,
                      onTap: () {
                        onTabChanged(tab.index);
                        pageController.animateToPage(
                          tab.index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    );
                  }).toList(),
            ),
          ),
        ),

        // PageView
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: onTabChanged,
            children:
                tabs.map((tab) {
                  return _buildPageContent(tab);
                }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPageContent(CustomTab tab) {
    switch (tab.index) {
      case 0:
        return InspectionTypeScreen();
      case 1:
        return VehicleTypeScreen();
      case 2:
        return BodyTypeScreen();
      case 3:
        return VehicleDetailScreen();
      case 4:
        return UserDetailScreen();
      case 5:
        return PaymentScreen();
      case 6:
        return ReceiptScreen();
        //return DummyView();
      default:
        return InspectionTypeScreen();
    }
  }
}

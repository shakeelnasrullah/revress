

// widgets/custom_tab_widget.dart
import 'package:flutter/material.dart';
import 'package:revress/inspection/tab_status.dart';

class CustomTabWidget extends StatelessWidget {
  final CustomTab tab;
  final bool isActive;
  final VoidCallback onTap;
  final double tabWidth;

  const CustomTabWidget({
    Key? key,
    required this.tab,
    required this.isActive,
    required this.onTap,
    this.tabWidth = 100,
  }) : super(key: key);

  Color _getIconColor(TabStatus status, bool isActive) {
    if (isActive) return Colors.blue;

    switch (status) {
      case TabStatus.completed:
        return Colors.green;
      case TabStatus.active:
        return Colors.blue;
      case TabStatus.pending:
        return Colors.grey;
    }
  }

  String _getIcon(TabStatus status, String baseIcon) {
    switch (status) {
      case TabStatus.completed:
        return "assets/images/checked_tab.png" ; // Override with completed icon
      case TabStatus.active:
        return "assets/images/active_tab.png";
      case TabStatus.pending:
        return "assets/images/default_tab.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: tabWidth,
        padding: const EdgeInsets.symmetric( horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const SizedBox(height: 6),
            Image.asset(
              _getIcon(tab.status, tab.icon),
              fit: BoxFit.contain,
              height: 50,
            ),

            const SizedBox(height: 4),

            // Text that shows only for active tab
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isActive
                  ? Text(
                tab.title,
                style: TextStyle(
                  color: _getIconColor(tab.status, isActive),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
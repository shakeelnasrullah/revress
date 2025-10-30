import 'package:flutter/material.dart';

class CustomToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;

  const CustomToolbar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Stack(
        children: [
          // Bottom oval shape
          Positioned(
            bottom: -40, // Adjust this value to control the oval depth
            left: 0,
            right: 0,
            child: Container(
              height: 80, // Adjust this value to control the oval height
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                // Optional leading widget (back button)
                /*IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),*/

                // Title in center
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Actions
                if (actions != null) ...actions!,

                // If no actions, add empty container for balanced spacing
                if (actions == null) SizedBox(width: 48), // Same width as back button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class OvalBottomToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;

  const OvalBottomToolbar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ToolbarPainter(backgroundColor: backgroundColor),
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 8,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Row(
          children: [
            // Leading widget (usually back button)
           /* leading ?? IconButton(
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
            if (actions == null) SizedBox(width: 48),
          ],
        ),
      ),
    );
  }
}

class _ToolbarPainter extends CustomPainter {
  final Color backgroundColor;

  _ToolbarPainter({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = backgroundColor;
    final path = Path();

    // Top rounded corners
    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);

    // Right side straight down
    path.lineTo(size.width, size.height - 40);

    // Bottom oval curve
    path.quadraticBezierTo(
      size.width, size.height,
      size.width / 2, size.height,
    );
    path.quadraticBezierTo(
      0, size.height,
      0, size.height - 40,
    );

    // Left side straight up
    path.lineTo(0, 20);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
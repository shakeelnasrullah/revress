import 'package:flutter/material.dart';
import 'package:revress/inspection/user_detail/appointment_listview.dart';

class DummyView extends StatefulWidget {
  const DummyView({super.key});

  @override
  State<DummyView> createState() => _DummyViewState();
}

class _DummyViewState extends State<DummyView> {
  DateTime? _selectedAppointment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(padding: const EdgeInsets.all(16.0),child: buildAppointmentView(),));
  }

  Widget buildAppointmentView() {
    return Stack(
      children: [
        // Card
        Container(
          margin: EdgeInsets.only(top: 60), // Space for the image
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 40), // Space for the overlapping image
              Text(
                'Card Content',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('This is your card content that goes below the image.'),
              // Add more content here
            ],
          ),
        ),

        // Image positioned to overlap the card
        Positioned(
          top: 0, // Start from top of stack
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Circular image
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/badge.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

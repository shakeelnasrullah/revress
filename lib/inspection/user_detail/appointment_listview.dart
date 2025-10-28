import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';

class AppointmentListview extends StatelessWidget {
  final DateTime? selectedAppointment;
  final Function(DateTime) onAppointmentSelected;

  const AppointmentListview({
    Key? key,
    required this.selectedAppointment,
    required this.onAppointmentSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate appointments for the next 7 days, 3 time slots per day
    final List<DateTime> appointments = [];

    for (int day = 0; day < 7; day++) {
      final date = DateTime.now().add(Duration(days: day));
      // Add 3 time slots per day: 9:00 AM, 2:00 PM, 5:00 PM
      appointments.add(DateTime(date.year, date.month, date.day, 9, 0));
      appointments.add(DateTime(date.year, date.month, date.day, 14, 0));
      appointments.add(DateTime(date.year, date.month, date.day, 17, 0));
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          final isSelected = selectedAppointment == appointment;
          return _buildAppointmentCard(appointment, isSelected);
        },
      ),
    );
  }

  Widget _buildAppointmentCard(DateTime dateTime, bool isSelected) {
    return GestureDetector(
      onTap: () => onAppointmentSelected(dateTime),
      child: Container(
        color: Colors.white,
        width: 120,
        margin: EdgeInsets.only(right: 12),
        child: Card(
          color: isSelected ? Colors.orangeAccent : Colors.orangeAccent[100],
          elevation: isSelected ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? Colors.orangeAccent : Colors.grey[300]!,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(12),
              padding: EdgeInsets.all(5),
              color: isSelected ? Colors.white : Colors.black!,
              strokeWidth: isSelected ? 0 : 2,
              dashPattern: [6, 6],
              strokeCap: StrokeCap.round
            ),

            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Day (Wed, Thu, Fri, etc.)
                  Text(
                    DateFormat('EEE').format(dateTime).toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Date (24 May, 25 May, etc.)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Date number
                      Text(
                        DateFormat('d').format(dateTime),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                      SizedBox(width: 4),
                      // Month name
                      Text(
                        DateFormat('MMM').format(dateTime),
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? Colors.white : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  // Time (09:00 PM)
                  Text(
                    DateFormat('hh:mm a').format(dateTime),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Availability Status
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Available',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.orangeAccent : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
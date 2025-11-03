import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:revress/app_colors.dart';

class AppointmentListview extends StatelessWidget {
  final DateTime? selectedAppointment;
  final Function(DateTime) onAppointmentSelected;
  final bool isDarkMode;
  final List<DateTime> bookedSlots; // Add this for booked slots

  const AppointmentListview({
    Key? key,
    required this.selectedAppointment,
    required this.onAppointmentSelected,
    required this.isDarkMode,
    this.bookedSlots = const [], // Initialize with empty list
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
          final isBooked = bookedSlots.any((booked) =>
          booked.year == appointment.year &&
              booked.month == appointment.month &&
              booked.day == appointment.day &&
              booked.hour == appointment.hour &&
              booked.minute == appointment.minute
          );

          return _buildAppointmentCard(appointment, isSelected, isBooked);
        },
      ),
    );
  }

  Widget _buildAppointmentCard(DateTime dateTime, bool isSelected, bool isBooked) {
    // Define gradients for different states
    final Gradient selectedGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF005AFF), // Orange
        Color(0xFF393939), // Light Orange
      ],
    );

    final Gradient availableGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xF47BFF00), // Blue
        Color(0xFF393939), // Purple
      ],
    );

    final Gradient bookedGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFE11111), // Orange
        Color(0xFF393939), // Light Orange
      ],
    );

    // Choose gradient based on state
    final Gradient currentGradient = isBooked
        ? bookedGradient
        : (isSelected ? selectedGradient : availableGradient);

    return GestureDetector(
      onTap: isBooked ? null : () => onAppointmentSelected(dateTime),
      child: Container(
        color: isDarkMode ? AppColors.darkBackground : Colors.white,
        width: 120,
        //margin: EdgeInsets.only(right: 12),
        child: Card(
          elevation:  4 ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: currentGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
              ],
            ),
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: Radius.circular(12),
                //padding: EdgeInsets.all(5),
                color: /*isBooked
                    ? Colors.red.withOpacity(0.5)*/
                     (isDarkMode && isSelected ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8) ),
                dashPattern: isSelected ? [5, 5] : isBooked ? [0, 0] : [0, 0],
                strokeCap: StrokeCap.round,
                strokeWidth: isSelected ? 2.5 :  isBooked ? 2.5 : 0,
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
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Date (24 May, 25 May, etc.)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Date number
                        Text(
                          textAlign: TextAlign.end,
                          DateFormat('d').format(dateTime),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4),
                        // Month name
                        Text(
                          textAlign: TextAlign.end,
                          DateFormat('MMM').format(dateTime).toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.9),
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
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Availability Status
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isBooked
                            ? Colors.red.withOpacity(0.9)
                            : (isSelected ? Colors.white : Colors.green.withOpacity(0.9)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        isBooked ? 'Booked' : 'Available',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: isBooked
                              ? Colors.white
                              : (isSelected ? AppColors.secondary : Colors.white),
                        ),
                      ),
                    ),

                    // Show booked icon for booked slots
                    /*if (isBooked) ...[
                      SizedBox(height: 4),
                      Icon(
                        Icons.lock_outline,
                        size: 12,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ],*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
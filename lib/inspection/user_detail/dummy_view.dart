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
    return AppointmentListview(
      selectedAppointment: _selectedAppointment,
      onAppointmentSelected: (appointment) {
        setState(() {
          _selectedAppointment = appointment;
        });
      },
    );
  }
}

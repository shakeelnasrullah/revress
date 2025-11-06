import 'package:flutter/material.dart';
import 'package:revress/inspection/user_detail/appointment_listview.dart';

class DummyView extends StatefulWidget {
  const DummyView({super.key});

  @override
  State<DummyView> createState() => _DummyViewState();
}

class _DummyViewState extends State<DummyView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildAppointmentView(),
      ),
    );
  }

  final Gradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF3A3A3A), // Orange
      Color(0xFF1D1D1D), // Light Orange
    ],
  );

  Widget buildAppointmentView() {
    return Stack(
      children: [

        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: blueGradient,
              borderRadius: BorderRadius.circular(12),

            ),
            //child: Text("Hi I am Shakeel", style: TextStyle(color: Colors.white),),
          ),
        ),
      Positioned(bottom: 0, right: 0, top: 0,
          child: Container(child: Image.asset("assets/images/tire.png", fit: BoxFit.contain,),))

      ],
    );
  }
}

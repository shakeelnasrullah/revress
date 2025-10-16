import 'package:flutter/material.dart';

class InspectionTypeScreen extends StatefulWidget {
  const InspectionTypeScreen({super.key});

  @override
  State<InspectionTypeScreen> createState() => _InspectionTypeScreenState();
}

class _InspectionTypeScreenState extends State<InspectionTypeScreen> {
  @override
  Widget build(BuildContext context) {
   return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: Colors.white,
            child: Column(
              children: [
                Image.asset("assets/images/physical.png"),
                Text(
                  "Physical Inspection",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "For those who have physical problems",
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              children: [
                Image.asset("assets/images/computer.png"),
                Text(
                  "Computerized Inspection",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "For those who want computerized inspection",
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

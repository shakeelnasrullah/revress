import 'package:flutter/material.dart';

class InspectionTypeScreen extends StatefulWidget {
  const InspectionTypeScreen({super.key});

  @override
  State<InspectionTypeScreen> createState() => _InspectionTypeScreenState();
}

class _InspectionTypeScreenState extends State<InspectionTypeScreen> {
  String? _selectedVehicleType;

  @override
  Widget build(BuildContext context) {
   return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildInspectionBtn("Physical Inspection", "For those who have physical problems", "assets/images/physical.png", "physical"),
          SizedBox(height: 10),
          buildInspectionBtn("Computerized Inspection", "For those who want computerized inspection", "assets/images/computer.png", "computerized"),

        /*  Card(
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
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
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
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
  Widget buildInspectionBtn(String title, String detail, String image, String selectedID){
    bool isSelected = _selectedVehicleType == selectedID;

    return GestureDetector(
        onTap: (){ setState(() {
          _selectedVehicleType = selectedID;
        });},
        child:  Stack(
            children : [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? Colors.blue : Colors.transparent,
                    width: isSelected ? 2 : 0,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(image, fit: BoxFit.fill,),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      detail,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              if (isSelected)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
            ])
    );}


}

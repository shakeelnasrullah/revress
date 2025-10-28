import 'package:flutter/material.dart';

class VehicleTypeScreen extends StatefulWidget {
  const VehicleTypeScreen({super.key});

  @override
  State<VehicleTypeScreen> createState() => _VehicleTypeScreenState();
}

class _VehicleTypeScreenState extends State<VehicleTypeScreen> {
  String? _selectedVehicleType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          buildInspectionBtn("Own Car", "Get your personal car inspection", "assets/images/own_car.png", "own"),
          SizedBox(height: 10),
          buildInspectionBtn("Seller's Car", "Get someone's car inspection", "assets/images/seller_car.png", "seller"),
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

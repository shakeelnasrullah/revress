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
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            buildInspectionBtn("Own Car", "Get your personal car inspection", "assets/images/own_car.png", "own", isDarkMode),
            SizedBox(height: 10),
            buildInspectionBtn("Seller's Car", "Get someone's car inspection", "assets/images/seller_car.png", "seller", isDarkMode),
          ],
        ),
      ),
    );
  }


  Widget buildInspectionBtn(String title, String detail, String image, String selectedID, bool isDarkMode){
    bool isSelected = _selectedVehicleType == selectedID;

    return GestureDetector(
        onTap: (){ setState(() {
          _selectedVehicleType = selectedID;
        });},
        child:  AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: Stack(
            children : [
              Card(
                color: isDarkMode ? Colors.grey[800] : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isSelected ? Colors.blue : Colors.grey[300]!,
                  width: isSelected ? 2.5 : 1.0,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: isSelected ? Colors.blue.withOpacity(0.1) : null,
                ),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(16),child: Image.asset(image, fit: BoxFit.fill,)),
                    Text(
                      title,
                      style: TextStyle(
                        color: isDarkMode || isSelected ? Colors.grey[300] : Colors.black ,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      detail,
                      style: TextStyle( color: isDarkMode ? Colors.grey[500] : Colors.black, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
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
          ]),
        )
    );}




}

import 'package:flutter/material.dart';

import 'BodyTypeListItem.dart';
import 'body_type.dart';

class BodyTypeScreen extends StatefulWidget {
  const BodyTypeScreen({super.key});

  @override
  State<BodyTypeScreen> createState() => _BodyTypeScreenState();
}

class _BodyTypeScreenState extends State<BodyTypeScreen> {
  int? selectedIndex;
  final List<BodyType> bodyTypes = [
    BodyType(
      name: 'Sedan',
      price: 'SAR : 250-400',
      imageUrl: 'assets/images/sedan.png',
    ),
    BodyType(
      name: 'SUV',
      price: 'SAR : 250-400',
      imageUrl: 'assets/images/suv.png',
    ),
    BodyType(
      name: 'Truck',
      price: 'SAR : 250-400',
      imageUrl: 'assets/images/truck.png',
    ),
    BodyType(
      name: 'Luxury Car',
      price: 'SAR : 250-400',
      imageUrl: 'assets/images/luxury.png',
    ),
    BodyType(
      name: 'Sports Car',
      price: 'SAR : 250-400',
      imageUrl: 'assets/images/sports.png',
    ),

    BodyType(
      name: 'Coupe',
      price: 'SAR : 250-400',
      imageUrl: 'assets/images/coupe.png',
    ),
    BodyType(
      name: 'Van',
      price: 'SAR : 250-400',
      imageUrl: 'assets/images/van.png',
    ),
    BodyType(
      name: 'Hatchback',
      price: 'SAR : 250-400',
      imageUrl: 'assets/images/hatchback.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Grid View
          Expanded(

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 180,
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.7, // Adjust card aspect ratio
                ),
                itemCount: bodyTypes.length,
                itemBuilder: (context, index) {

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle selection - if already selected, deselect it
                        if (selectedIndex == index) {
                          selectedIndex = null;
                        } else {
                          selectedIndex = index;
                        }
                      });

                      // You can also add your custom logic here when item is tapped
                      print('Selected body type: ${bodyTypes[index].name}');
                    },
                    child: BodyTypeListItem(
                      product: bodyTypes[index],
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


}


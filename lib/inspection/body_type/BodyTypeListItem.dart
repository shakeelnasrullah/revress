import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';
import 'package:revress/inspection/body_type/body_type.dart';



class BodyTypeListItem extends StatelessWidget {
  final BodyType product;
  final bool isSelected;
  final bool isDarkMode;


  const BodyTypeListItem({
    Key? key,
    required this.product,
    this.isSelected = false,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      child: Card(
        color: isDarkMode ? AppColors.darkItemColor : Colors.white,
        elevation: isSelected ? 6.0 : 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: isSelected ? 2.5 : 1.0,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: isSelected
                ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue.withOpacity(0.1), Colors.white],
            )
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image with overlay
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        product.imageUrl,
                        height: 80,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    // Selection indicator
                    if (isSelected)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.5),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.bold,
                    height: 1.3,
                    color: isSelected ? Colors.blue[900] : Colors.blue[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 6),

              // Price
              Text(
                '\$${product.price}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? Colors.blue[800] : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
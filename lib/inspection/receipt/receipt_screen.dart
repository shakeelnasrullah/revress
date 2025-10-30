import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';

import 'multi_point_bottom_card.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(children: [

                _buildReceiptCard(),
                Positioned(top: 0, left: 0, right: 0,
                    child: Center(child: Container( width: 80,
                      padding: EdgeInsets.all(4),
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle, // Circular image
                        //border: Border.all(color: Colors.white, width: 2),
                        /*boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],*/
                      ),
                      child: ClipOval(child: Image.asset("assets/images/car_logo.png", fit: BoxFit.scaleDown,),
                      ),),)
                ),
              ],),
              //_buildReceiptCard(),
              SizedBox(height: 20),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
  

  Widget _buildReceiptCard() {
    
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: MultiPointBottomCard(
        elevation: 4,
        //backgroundColor: Colors.blue[500]!,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              SizedBox(height: 24),
              Center(
                child: Text(
                  'Car Inspection Summary',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Total Payment Section
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
                      color: Colors.white,


                      child: Padding(
                        padding: EdgeInsets.all(16) ,
                        child: Column(
                          children: [
                            Text(
                              'Total Payment',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue[800],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'AED 350',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '(Tax Exc.)',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue[700],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Expanded(child:
                  Image.asset("assets/images/badge.png", fit: BoxFit.scaleDown,
                    width: 130, height: 130,))
                ],
              ),
              SizedBox(height: 24),

              // Divider
              Divider(color: Colors.grey[300], height: 1, indent: 2,),
              SizedBox(height: 24),

              // Details Section
              _buildDetail1(),
              SizedBox(height: 8,),
              _buildDetail2(),
              SizedBox(height: 8,),
              _buildDetail3(),
              SizedBox(height: 8,),
              _buildDetail4(),
              SizedBox(height: 16)

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail1() {
    return Row(
      children: [
        Expanded(child: _buildDetailRow('Car Year', '2024')),
        SizedBox(width: 10,),
        Expanded(child: _buildDetailRow('Car Variant', 'Mercedes Benz')),
      ],
    );
  }
  Widget _buildDetail2() {
    return Row(
      children: [
        Expanded(child: _buildDetailRow('Requested By', 'Saleddine Yousaf')),
        SizedBox(width: 10,),
        Expanded(child: _buildDetailRow('Requested Date', '12 May 2024')),
      ],
    );
  }
  Widget _buildDetail3() {
    return Row(
      children: [
        Expanded(child: _buildDetailRow('Inspection Date', '14 May 2024')),
        SizedBox(width: 10,),
        Expanded(child: _buildDetailRow('Inspection Slot', '12:00 to 12:45')),
      ],
    );
  }
  Widget _buildDetail4() {
    return Row(
      children: [
        Expanded(child: _buildDetailRow('Payment Date', '14 May 2024')),
        SizedBox(width: 10,),
        Expanded(child: _buildDetailRow('Payment with', 'Apple Pay')),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Card(
      elevation: 1,
       color:  AppColors.primary,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(
          color:  Colors.grey[500]!,
          width:  1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[200],
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // Share functionality
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Colors.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share, color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Text(
                  'Share',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Download functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.download, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'Download',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

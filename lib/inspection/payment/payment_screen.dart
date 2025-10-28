import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';
import 'package:revress/common/common_btn.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            _buildPaymentBtn(
              "Credit / Debit Card",
              "XXXX XXXX XXXX 7890",
              "assets/images/mastercard_pay.png",
              Colors.grey[200]!,
              "card",
            ),
            SizedBox(height: 8),
            _buildPaymentBtn(
              "Apple Pay",
              "Pay with Apple Pay",
              "assets/images/apple_pay.png",
              Colors.grey[200]!,
              "apple",
            ),
            SizedBox(height: 8),
            _buildPaymentBtn(
              "Samsung Pay",
              "Pay with Samsung Pay",
              "assets/images/samsung_pay.png",
              Colors.blue[900]!,
              "samsung",
            ),
            SizedBox(height: 8),
            _buildPaymentBtn(
              "Google Pay",
              "Pay with Google Pay",
              "assets/images/google_pay.png",
              Colors.grey[200]!,
              "google",
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: buildRoundedButton(text: "Previous", backgroundColor: AppColors.darkGray, onPressed: () {})),
                SizedBox(width: 16),
                Expanded(child: buildRoundedButton(text: "Next", backgroundColor: AppColors.secondary, onPressed: () {})),
            ],),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentBtn(String title, String detail, String image, Color color, String paymentId){
    bool isSelected = _selectedPaymentMethod == paymentId;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = paymentId;
        });
      },
      child: AnimatedContainer( duration:
        Duration(milliseconds: 200),
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: isSelected ? 2 : 0,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: isSelected
                  ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.withOpacity(0.1), Colors.white],
              )
                  : null,
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Card(
                        elevation: 2,
                        color: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            image,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              detail,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Tick icon for selected item
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
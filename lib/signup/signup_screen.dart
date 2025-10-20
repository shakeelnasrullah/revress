import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:revress/common/common_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _user_name_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _phone_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();

  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');

  @override
  void dispose() {
    super.dispose();
    _user_name_controller.dispose();
    _email_controller.dispose();
    _phone_controller.dispose();
    _password_controller.dispose();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 32, // Subtract padding
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top spacer - replaced with flexible space
                    SizedBox(height: 20), // Reduced from Spacer()

                    Image.asset(
                      "assets/images/app_icon.png",
                      width: 250,
                      height: 150,
                      fit: BoxFit.fill,
                    ),

                    SizedBox(height: 16),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Text(
                            "Welcome to Revress!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.darkGray,
                            ),
                          ),
                          Text(
                            "Let's Create Your Account Here",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                              color: AppColors.lightGray,
                            ),
                          ),
                          SizedBox(height: 20),
                         // requireTextLabel("Email Address"),
                          genericTextField(_user_name_controller, "Enter Your Username",  Icon(Icons.person)),
                          SizedBox(height: 16),

                          showPhoneNumber(_phone_controller, number),

                          SizedBox(height: 16),
                          genericTextField(_email_controller, "Enter Your Email", Icon(Icons.mail)),
                          SizedBox(height: 16),
                          genericTextField(_password_controller, "Enter Your Password", Icon(Icons.lock)),
                          SizedBox(height: 16),
                          //requireTextLabel("Password"),
                          SizedBox(height: 30),
                          //rememberMeRow(),
                          rectangleThemeBtn("Sign Up",  () {
                            print("Sign Up");
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                          }),
                        ],
                      ),
                    ),

                    // Bottom spacer - replaced with flexible space
                    SizedBox(height: 20), // Reduced from Spacer()

                    Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightGray,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


Widget showPhoneNumber(TextEditingController _phone_controller, PhoneNumber number){
  return  InternationalPhoneNumberInput(onInputChanged: (PhoneNumber phoneNumber){
    print(phoneNumber.phoneNumber);
  },
      onInputValidated: (bool value){
        print(value);
      },
      selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          useEmoji: false, showFlags: true, useBottomSheetSafeArea: true),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: _phone_controller,
      formatInput: true,
      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
      inputBorder: OutlineInputBorder(),
      onSaved: (PhoneNumber phoneNumber){
        print('On Saved: $phoneNumber');
      });

}

Widget rectangleThemeBtn(String name, Function onClick) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Button background color
        foregroundColor: Colors.black, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Round corners
          side: BorderSide(color: Colors.black, width: 1), // Black border
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ), // Inner padding
      ),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Space between image and text
          Text('Sign In', style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    ),
  );
}
}






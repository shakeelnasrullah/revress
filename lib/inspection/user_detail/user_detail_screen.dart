import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';
import 'package:revress/common/common_widgets.dart';
import 'package:revress/common/phone_edit_text.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:revress/inspection/user_detail/appointment_listview.dart';
import 'package:revress/common/common_btn.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  String? selectedProvince;
  String? selectedCity;
  String? selectedBranch;

  final TextEditingController _phone_controller = TextEditingController();
  final TextEditingController _name_controller = TextEditingController();

  DateTime? _selectedAppointment;

  final List<String> cityNames = [
    'Lahore',
    'Karachi',
    'Islamabad',
    'Peshawar',
    'Quetta',
    'Multan',
    'Hyderabad',
    'Faisalabad',
    'Sukkur',
    'Rawalpindi',
  ];
  final List<String> provinceNames = [
    'Punjab',
    'Sindh',
    'Balochistan',
    'Khyber Pakhtunkhwa',
    'Gilgit Baltistan',
  ];
  final List<String> branchNames = [
    'Shahdra',
    'Model Town',
    "Askari 11",
    "Kot Lakhpat",
    "Mughal Pura",
    "Minar e Pakistan",
    "Kahna Nou",
  ];

  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  String initialCountry = 'PK';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(16), child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLabel("Full Name"),
                  genericTextField(_name_controller, "Enter Your Full Name", null),
                  SizedBox(height: 16),
                  _buildLabel("Phone Number"),
                  PhoneEditText.showPhoneNumber(_phone_controller, number),
                  SizedBox(height: 16),
                  _buildLabel("Province"),
                  buildDropdown(
                    value: selectedProvince,
                    items: provinceNames,
                    hint: 'Select Province',
                    onChanged: (value) {
                      setState(() {
                        selectedProvince = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  _buildLabel("City"),
                  buildDropdown(
                    value: selectedCity,
                    items: cityNames,
                    hint: 'Select City',
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  _buildLabel("Branch"),
                  buildDropdown(
                    value: selectedBranch,
                    items: branchNames,
                    hint: 'Select Branch',
                    onChanged: (value) {
                      setState(() {
                        selectedBranch = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),

                ],
              ),),
              Text("Available Slots", style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),),
              buildAppointmentView(),

              //SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    // Reset Button
                    Expanded(
                      child: buildRoundedButton(
                        text: 'Reset',
                        backgroundColor: AppColors.darkGray,
                        onPressed: () {

                        },
                      ),
                    ),
                    SizedBox(width: 15),

                    // Submit Button
                    Expanded(
                      child: buildRoundedButton(
                        text: 'Submit',
                        backgroundColor: AppColors.secondary,
                        onPressed: () {

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }




  Widget _buildLabel(String label) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Text(label, style: TextStyle(color: Colors.black, fontSize: 14)),
              SizedBox(width: 4),
              Text("*", style: TextStyle(color: Colors.red, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAppointmentView() {
    return AppointmentListview(
      selectedAppointment: _selectedAppointment,
      onAppointmentSelected: (appointment) {
        setState(() {
          _selectedAppointment = appointment;
        });
      },
    );
  }


}

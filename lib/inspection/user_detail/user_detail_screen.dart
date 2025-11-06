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

  DateTime? selectedAppointment;
  final bool isDarkMode = false;

  // Example booked slots
  // FIXED: Booked slots with minutes set to 0 to match appointment slots
  final List<DateTime> bookedSlots = [
    // Tomorrow 9:00 AM (minutes set to 0)
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
      9,
      0,
    ),
    // Day after tomorrow 2:00 PM (minutes set to 0)
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 2,
      14,
      0,
    ),
    // In 3 days 5:00 PM (minutes set to 0)
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 3,
      17,
      0,
    ),
  ];

  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  String initialCountry = 'PK';

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkBackground : Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLabel("Full Name", isDarkMode),
                  genericTextField(
                    _name_controller,
                    "Enter Your Full Name",
                    null,
                    isDarkMode,
                  ),
                  SizedBox(height: 16),
                  _buildLabel("Phone Number", isDarkMode),
                  PhoneEditText.showPhoneNumber(
                    _phone_controller,
                    isDarkMode,
                    number,
                  ),
                  SizedBox(height: 16),
                  _buildLabel("Province", isDarkMode),
                  buildDropdown(
                    value: selectedProvince,
                    items: provinceNames,
                    hint: 'Select Province',
                    isDarkMode: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        selectedProvince = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  _buildLabel("City", isDarkMode),
                  buildDropdown(
                    value: selectedCity,
                    items: cityNames,
                    hint: 'Select City',
                    isDarkMode: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  _buildLabel("Branch", isDarkMode),
                  buildDropdown(
                    value: selectedBranch,
                    items: branchNames,
                    hint: 'Select Branch',
                    isDarkMode: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        selectedBranch = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Text(
              "Available Slots",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: isDarkMode ? Colors.grey[300] : AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            buildAppointmentView(isDarkMode),

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
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 15),

                  // Submit Button
                  Expanded(
                    child: buildRoundedButton(
                      text: 'Submit',
                      backgroundColor: AppColors.secondary,
                      onPressed: () {},
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

  Widget _buildLabel(String label, bool isDarkMode) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isDarkMode ? Colors.grey[400] : Colors.black,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 4),
              Text("*", style: TextStyle(color: Colors.red, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAppointmentView(bool isDarkMode) {
    return AppointmentListview(
      selectedAppointment: selectedAppointment,
      onAppointmentSelected: (dateTime) {
        setState(() {
          selectedAppointment = dateTime;
        });
      },
      isDarkMode: isDarkMode,
      bookedSlots: bookedSlots,
    );
  }
}

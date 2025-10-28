import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';

class VehicleDetailScreen extends StatefulWidget {
  const VehicleDetailScreen({super.key});

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {

  // Dropdown values
  String? selectedYear;
  String? selectedCountry;
  String? selectedBrandModel;
  String? selectedVariant;

  // Sample data
  final List<String> years = ['2024', '2023', '2022', '2021', '2020'];
  final List<String> countries = ['USA', 'Canada', 'Germany', 'Japan', 'UK'];
  final List<String> brandModels = ['Toyota Camry', 'Honda Civic', 'Ford Mustang', 'BMW X5', 'Mercedes C-Class'];
  final List<String> variants = ['Base', 'Sport', 'Luxury', 'Premium', 'Limited'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Form Fields
              _buildLabel("Select Car Year"),
              SizedBox(height: 4),
              // Year Dropdown
              _buildDropdown(
                value: selectedYear,
                items: years,
                hint: 'Select Year',
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildLabel("Select Country"),
              SizedBox(height: 4),
              // Country Dropdown
              _buildDropdown(
                value: selectedCountry,
                items: countries,
                hint: 'Select Country',
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildLabel("Select Brand Model"),
              SizedBox(height: 4),
              // Brand Model Dropdown
              _buildDropdown(
                value: selectedBrandModel,
                items: brandModels,
                hint: 'Select Brand Model',
                onChanged: (value) {
                  setState(() {
                    selectedBrandModel = value;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildLabel("Select Variant"),
              SizedBox(height: 4),
              // Variant Dropdown
              _buildDropdown(
                value: selectedVariant,
                items: variants,
                hint: 'Select Variant',
                onChanged: (value) {
                  setState(() {
                    selectedVariant = value;
                  });
                },
              ),

              // Add some extra space before buttons
              SizedBox(height: 40),

              // Buttons Row
              Row(
                children: [
                  // Reset Button
                  Expanded(
                    child: _buildRoundedButton(
                      text: 'Reset',
                      backgroundColor: AppColors.darkGray,
                      onPressed: () {
                        _resetAll();
                      },
                    ),
                  ),
                  SizedBox(width: 15),

                  // Submit Button
                  Expanded(
                    child: _buildRoundedButton(
                      text: 'Submit',
                      backgroundColor: AppColors.secondary,
                      onPressed: () {
                        _submitForm();
                      },
                    ),
                  ),
                ],
              ),

              // Extra padding at the bottom for better scrolling
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label){
    return Row(
      children: [
        Text(label, style: TextStyle(color: Colors.black, fontSize: 16),),
        SizedBox(width: 4,),
        Text("*", style: TextStyle(color: Colors.red, fontSize: 16), ),
      ],
    );
  }

  // Reusable dropdown widget
  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: Colors.white,
          underline: SizedBox(), // Remove default underline
          borderRadius: BorderRadius.circular(8),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildRoundedButton({
    required String text,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  void _resetAll() {
    setState(() {
      selectedYear = null;
      selectedCountry = null;
      selectedBrandModel = null;
      selectedVariant = null;
    });
  }

  void _submitForm() {
    if (selectedYear == null ||
        selectedCountry == null ||
        selectedBrandModel == null ||
        selectedVariant == null) {
      _showSnackBar('Please fill all fields');
      return;
    }

    // Here you would typically handle the form submission
    _showSnackBar('Selected: $selectedYear, $selectedCountry, $selectedBrandModel, $selectedVariant');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneEditText {
  static Widget showPhoneNumber(
      TextEditingController _phone_controller,
      bool isDarkMode,
      PhoneNumber number, {
        double borderRadius = 4.0,
        Color focusedBorderColor = Colors.blue,
        Color borderColor = Colors.grey,
      }) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber phoneNumber) {
        print(phoneNumber.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        useEmoji: false,
        showFlags: true,
        useBottomSheetSafeArea: true,
        leadingPadding: 16,
        setSelectorButtonAsPrefixIcon: true,
      ),
      selectorTextStyle: TextStyle(
        color: isDarkMode ? Colors.grey[400] : Colors.black,
        fontSize: 16,
      ),
      // Add text style for the input field
      textStyle: TextStyle(
        color: isDarkMode ? Colors.grey[300] : Colors.black, // Light grey for dark mode, black for light
        fontSize: 16,
      ),
      ignoreBlank: true,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: number,
      textFieldController: _phone_controller,
      formatInput: true,
      keyboardType: TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),

      // Custom selector button decoration
      selectorButtonOnErrorPadding: 0,
      spaceBetweenSelectorAndTextField: 0,

      // Input decoration for the entire widget
      inputDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.grey[500]! : Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.grey[500]! : Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // Add hint style as well if you use hint text
        hintStyle: TextStyle(
          color: isDarkMode ? Colors.grey[500] : Colors.grey[600],
        ),

        // Custom prefix icon styling (this affects the country code selector)
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: isDarkMode ? Colors.grey[500]! : Colors.grey[400]!,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),

      // Custom country selector style
      countrySelectorScrollControlled: false,
      onSaved: (PhoneNumber phoneNumber) {
        print('On Saved: $phoneNumber');
      },
    );
  }
}
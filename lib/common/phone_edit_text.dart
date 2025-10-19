import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneEditText {

   static Widget showPhoneNumber(
      TextEditingController _phone_controller,
      PhoneNumber number, {
        double borderRadius = 8.0,
        Color borderColor = Colors.grey,
        Color focusedBorderColor = Colors.blue,
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

      ),
      selectorTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: number,
      textFieldController: _phone_controller,
      formatInput: true,
      keyboardType: TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      inputDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onSaved: (PhoneNumber phoneNumber) {
        print('On Saved: $phoneNumber');
      },
    );
  }
}
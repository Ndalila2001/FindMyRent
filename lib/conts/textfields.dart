import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

// Email Text Field
class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText; // Optional hint text

  const EmailTextField({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText ?? 'Your Email',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
          fontFamily: 'Clarendon',
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 26.h),
      ),
      style: TextStyle(
        fontSize: 18.sp,
        height: 0.9,
        fontFamily: 'Clarendon',
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}

// Password Text Field with Show/Hide Feature
class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText; // Optional hint text

  const PasswordTextField({super.key, required this.controller, this.hintText});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscured,
      style: TextStyle(
        fontFamily: 'Clarendon',
        fontSize: 18.sp,
        color: Theme.of(context).colorScheme.surface,
        height: 0.9,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Enter Password',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
          fontFamily: 'Clarendon',
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        contentPadding: EdgeInsets.only(left: 54.w, top: 26.h, bottom: 26.h),
        suffixIcon: IconButton(
          iconSize: 24.sp,
          icon: Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Icon(
              _obscured ? LucideIcons.eye : LucideIcons.eyeOff,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          onPressed: () {
            setState(() {
              _obscured = !_obscured;
            });
          },
        ),
      ),
    );
  }
}

// Date of Birth Field with Masking
class DateOfBirthField extends StatefulWidget {
  final TextEditingController controller;

  const DateOfBirthField({super.key, required this.controller});

  @override
  State<DateOfBirthField> createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 195.w,
      child: TextFormField(
        controller: _internalController,
        inputFormatters: [
          _DateMaskFormatter(), // Custom formatter with auto-correction
        ],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.sp,
          height: 0.9,
          fontFamily: 'Clarendon',
          color: Theme.of(context).colorScheme.surface,
        ),
        decoration: InputDecoration(
          hintText: 'DD/MM/YYYY',
          hintStyle: TextStyle(
            fontSize: 18.sp,
            color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
            fontFamily: 'Clarendon',
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(22.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(22.r),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 26.h,
            horizontal: 18.w,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Enter date';
          if (!_isDate(value)) return 'Invalid date';
          return null;
        },
      ),
    );
  }

  bool _isDate(String input) {
    try {
      final parts = input.split('/');
      if (parts.length != 3) return false;

      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      if (month < 1 || month > 12) return false;
      if (day < 1 || day > 31) return false;

      final date = DateTime(year, month, day);
      return date.year == year && date.month == month && date.day == day;
    } catch (e) {
      return false;
    }
  }
}

class _DateMaskFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Allow deletion
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    // Extract only digits from input
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Build formatted string with auto-correction
    var formatted = '';
    for (int i = 0; i < digitsOnly.length && i < 8; i++) {
      // Add digit
      var digit = digitsOnly[i];

      // Auto-correct based on position
      if (i == 0 && digit.codeUnitAt(0) > '3'.codeUnitAt(0)) {
        digit = '3'; // First day digit can't be > 3
      }

      if (i == 1) {
        // Second day digit - check with first digit
        final firstDayDigit = formatted.isNotEmpty ? formatted[0] : '0';
        if (firstDayDigit == '3' && digit.codeUnitAt(0) > '1'.codeUnitAt(0)) {
          digit = '1'; // 3X can't be > 31
        } else if (firstDayDigit == '0' && digit == '0') {
          digit = '1'; // Can't be 00
        }
      }

      if (i == 2) {
        // First month digit can't be > 1
        if (digit.codeUnitAt(0) > '1'.codeUnitAt(0)) {
          digit = '1';
        }
      }

      if (i == 3) {
        // Second month digit
        final firstMonthDigit = formatted.isNotEmpty ? formatted[2] : '0';
        if (firstMonthDigit == '1' && digit.codeUnitAt(0) > '2'.codeUnitAt(0)) {
          digit = '2'; // 1X can't be > 12
        } else if (firstMonthDigit == '0' && digit == '0') {
          digit = '1'; // Can't be 00
        }
      }

      if (i == 4) {
        // First year digit - must be 1 or 2 (for 1900-2099)
        if (digit != '1' && digit != '2') {
          digit = '1';
        }
      }

      formatted += digit;

      // Add slashes at positions
      if (i == 1 || i == 3) {
        formatted += '/';
      }
    }

    // Auto-correct complete sections in real-time
    if (formatted.length >= 2) {
      final day = int.tryParse(formatted.substring(0, 2)) ?? 0;
      if (day > 31) {
        formatted = '31' + (formatted.length > 2 ? formatted.substring(2) : '');
      } else if (day == 0) {
        formatted = '01' + (formatted.length > 2 ? formatted.substring(2) : '');
      }
    }

    if (formatted.length >= 5) {
      final month = int.tryParse(formatted.substring(3, 5)) ?? 0;
      if (month > 12) {
        formatted = formatted.substring(0, 3) +
            '12' +
            (formatted.length > 5 ? formatted.substring(5) : '');
      } else if (month == 0) {
        formatted = formatted.substring(0, 3) +
            '01' +
            (formatted.length > 5 ? formatted.substring(5) : '');
      }
    }

    // Validate and correct year if complete (1900-2026)
    if (formatted.length >= 10) {
      final year = int.tryParse(formatted.substring(6, 10)) ?? 0;
      final currentYear = DateTime.now().year;

      if (year < 1900 || year > currentYear) {
        // Adjust the year
        var correctedYear = year;
        if (year < 1900) {
          correctedYear = 1900;
        } else if (year > currentYear) {
          correctedYear = currentYear;
        }
        formatted = formatted.substring(0, 6) + correctedYear.toString();
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

//Dynamic Dropdown Widget
class CustomDropdown extends StatefulWidget {
  final TextEditingController
      controller; // Controller to store the selected value
  final String hintText; // Hint text for the dropdown
  final List<String> options; // List of options for the dropdown

  const CustomDropdown({
    super.key,
    required this.controller,
    required this.hintText,
    required this.options,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedOption; // Stores the selected value

  @override
  void initState() {
    super.initState();
    // Initialize the selectedOption with the value from the controller
    selectedOption =
        widget.controller.text.isNotEmpty ? widget.controller.text : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 195.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Theme.of(context).colorScheme.surface,
                width: 2.0,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedOption,
                dropdownColor: Theme.of(context).colorScheme.surface,
                hint: Center(
                  child: Text(
                    widget.hintText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.surface.withOpacity(0.5),
                      fontFamily: 'Clarendon',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                isExpanded: true, // Expand to fill the container
                icon: Icon(
                  LucideIcons.arrowDown,
                  color: Theme.of(context).colorScheme.surface,
                ),
                items: widget.options.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Center(
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Clarendon',
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value; // Update the selected value
                    widget.controller.text =
                        selectedOption ?? ''; // Update the controller
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Code Text Field for OTP or Verification Code
class CodeTextField extends StatefulWidget {
  final TextEditingController controller;
  final double fieldWidth;
  final double fieldHeight;
  final double borderRadius;
  final EdgeInsets fieldMargin;

  const CodeTextField({
    super.key,
    required this.controller,
    this.fieldWidth = 60,
    this.fieldHeight = 60,
    this.borderRadius = 12,
    this.fieldMargin = const EdgeInsets.symmetric(horizontal: 8),
  });

  @override
  _CodeTextFieldState createState() => _CodeTextFieldState();
}

class _CodeTextFieldState extends State<CodeTextField> {
  final List<TextEditingController> controllers = [];
  final List<FocusNode> focusNodes = [];
  final int fieldCount = 6; // Change this to 6 fields

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < fieldCount; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1 && index < fieldCount - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    widget.controller.text =
        controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(fieldCount, (index) {
        return Container(
          margin: widget.fieldMargin,
          width: 60.w, // Adjust width if necessary
          height: 80.h, // Adjust height if necessary
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            maxLength: 1,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.sp,
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: 'Clarendon',
            ),
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(22.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(22.r),
              ),
            ),
            onChanged: (value) => _onChanged(index, value),
          ),
        );
      }),
    );
  }
}

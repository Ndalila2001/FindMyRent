import 'package:find_my_rent/conts/buttons.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;

  const CustomDialog({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.bold,
                fontFamily: 'Clarendon',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Clarendon",
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            const SizedBox(height: 24),
            MainButton1(
              text: "Close",
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example:
// showDialog(
//   context: context,
//   builder: (context) => CustomDialog(
//     title: "Error",
//     message: "Something went wrong!",
//   ),
// );

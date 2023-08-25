import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  // Added missing constructor body and named parameters
  RoundedButton({
    this.btnName,
    this.bgColor,
    this.callback,
    this.icon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback, // Removed unnecessary function call
      style: ElevatedButton.styleFrom(
        // Use bgColor if provided, else use default background color
        primary: bgColor ?? Colors.blue,
      ),
      child: icon != null // Check if icon is provided
          ? Row(
              children: [
                icon!,
                SizedBox(width: 8), // Added some spacing between icon and text
                Text(btnName!, style: textStyle),
              ],
            )
          : Text(btnName!, style: textStyle), // Used ! to indicate non-nullability
    );
  }
}

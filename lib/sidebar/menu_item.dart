import 'package:flutter/material.dart';

Color iconColor = Colors.white70;
Color textColor = Colors.white;

class MenuItems extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final void Function()? onTap;
  final Color? textColor; // Add a textColor parameter

  const MenuItems({
    super.key,
    this.icon,
    this.title,
    this.onTap,
    this.textColor, // Initialize the textColor parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title!,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

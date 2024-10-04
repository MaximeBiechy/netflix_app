import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color? color;
  final Icon? icon;

  const BasicAppButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.height,
      this.color = Colors.white,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 28,
            icon?.icon,
            color: color == Colors.white ? Colors.black : Colors.white,
          ),
          SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: color == Colors.white ? Colors.black : Colors.white),
          )
        ],
      ),
    );
  }
}

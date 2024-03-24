import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
  });

  final String text;
  final IconData icon;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: onPress,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(20)),
              height: 120,
              width: 290,
              child: Center(
                  child: Text(
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      text)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF9EBBB6),
                  radius: 75 / 2,
                  child: Icon(color: Colors.black, size: 50, icon),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        shape: CircleBorder(),
                        elevation: 4,
                        backgroundColor: Color(0xFFF8F8F8)),
                    onPressed: onPress,
                    child: Icon(
                        color: Color(0xFF39978B),
                        size: 45,
                        Icons.arrow_right_alt))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

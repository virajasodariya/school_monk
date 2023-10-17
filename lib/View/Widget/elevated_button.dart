import 'package:flutter/material.dart';
import 'package:school_monk/Constants/color.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(PickColor.primaryColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: PickColor.kBlack),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

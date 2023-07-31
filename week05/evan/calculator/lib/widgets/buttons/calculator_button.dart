import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String? text;
  final Widget? child;

  CalculatorButton(
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.text,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.indigo),
              backgroundColor: MaterialStateProperty.all(backgroundColor ?? Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                        color: Colors.grey) // Add border to the button
                    ),
              ),
            ),
            onPressed: () {
              onPressed();
            },
            child: text != null
                ? Text(
                    text!,
                    style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w300),
                  )
                : (child ?? Container())));
  }
}

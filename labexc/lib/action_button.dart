// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final Color btncolor;
  final double colorvalue;
  final VoidCallback onPressed;
  final bool? changeColor;
  const ActionButton({
    Key? key,
    required this.colorvalue,
    required this.onPressed,
    required this.btncolor,
    required this.changeColor,
  }) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return widget.changeColor!
        ? FloatingActionButton(
            onPressed: widget.onPressed,
            shape: const CircleBorder(),
            backgroundColor: widget.btncolor,
            child: Text("${widget.colorvalue.toInt()}"),
          )
        : FloatingActionButton(
            onPressed: null,
            shape: const CircleBorder(),
            backgroundColor: widget.btncolor,
            child: Text("${widget.colorvalue.toInt()}"),
          );
  }
}

import 'package:flutter/material.dart';

class ColorSlider extends StatefulWidget {
  final bool? colorchange;
  final double colorvalue;
  final ValueChanged<double> onChanged;
  const ColorSlider(
      {super.key,
      required this.onChanged,
      required this.colorvalue,
      this.colorchange});

  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  @override
  Widget build(BuildContext context) {
    return widget.colorchange!
        ? Slider(
            value: widget.colorvalue,
            min: 0,
            max: 255,
            onChanged: widget.onChanged,
          )
        : Slider(
            value: widget.colorvalue,
            min: 0,
            max: 255,
            onChanged: null,
          );
  }
}

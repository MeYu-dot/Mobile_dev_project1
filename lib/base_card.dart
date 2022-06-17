import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {

  const BaseCard({required this.theColor, required this.theChild, this.theOnTap});
  final Color theColor;
  final Widget theChild;
  final VoidCallback? theOnTap;
  // const means never changed
  // final you can set it once
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: theOnTap,
      child: Container(
        child: theChild,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: theColor,
            borderRadius: BorderRadius.circular(7.0)
        ),
      ),
    );
  }
}
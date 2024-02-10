import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.width = double.infinity,
    this.height = 60,
    this.padding = 14.0,
    required this.color,
    this.textColor = Colors.white,
    this.isNotFullColor,
    this.isFullFilled = true,
    this.radius = 12.0,
    this.isLoading = false,
    this.text,
    required this.onPress,
    this.child,
    this.widthBorder,
    this.colorBorder,
  }) : super(key: key);

  final double? width;
  final double? widthBorder;
  final double height;
  final double padding;
  final Color color;
  final Color? colorBorder;
  final Color textColor;
  final Color? isNotFullColor;
  final bool isFullFilled;
  final double radius;
  final bool isLoading;
  final String? text;
  final Function() onPress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isLoading ? null : onPress,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: isFullFilled ? color : isNotFullColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            width: widthBorder ?? 1,
            color: colorBorder ?? color,
          ),
        ),
        child: isLoading ? CircularProgressIndicator.adaptive() :  Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            fontFamily: 'mp',
            color: isFullFilled ? textColor : Colors.amber,
          ),
        ),
      ),
    );
  }
}

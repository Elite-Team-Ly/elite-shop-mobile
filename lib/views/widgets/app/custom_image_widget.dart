import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final bool withShadow;
  final bool isNetwork;

  const CustomImageWidget({
    super.key,
    required this.imagePath,
    this.width = 200.0,
    this.height = 200.0,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.borderRadius,
    this.backgroundColor,
    this.withShadow = false,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow:
            withShadow
                ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]
                : [],
      ),
      child:
          isNetwork
              ? Image.network(imagePath, fit: fit)
              : Image.asset(imagePath, fit: fit),
    );
  }
}

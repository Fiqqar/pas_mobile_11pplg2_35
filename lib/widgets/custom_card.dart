import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final bool hasShadow;
  final double elevation;
  final List<BoxShadow>? customShadow;
  final double topRadius;
  final double bottomRadius;
  final double? height;
  final double width;
  final double? marginBottom;
  final double? marginTop;

  const CustomCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
    this.color = ColorPalette.backgroundColor,
    this.hasShadow = true,
    this.elevation = 8.0,
    this.customShadow,
    this.bottomRadius = 0.0,
    this.topRadius = 20.0,
    this.width = double.infinity,
    this.height,
    this.marginBottom,
    this.marginTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      margin: EdgeInsets.only(top: marginTop ?? 0, bottom: marginBottom ?? 0),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRadius),
          topRight: Radius.circular(topRadius),
          bottomLeft: Radius.circular(bottomRadius),
          bottomRight: Radius.circular(bottomRadius),
        ),
        boxShadow: hasShadow
            ? customShadow ??
                  [
                    BoxShadow(
                      color: ColorPalette.shadowColor,
                      offset: const Offset(0, 4),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: ColorPalette.shadowColor,
                      offset: const Offset(0, 2),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ]
            : null,
      ),
      child: child,
    );
  }
}

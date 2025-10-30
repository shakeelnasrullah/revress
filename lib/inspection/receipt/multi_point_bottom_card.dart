import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:revress/app_colors.dart';

class MultiPointBottomCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double elevation;

  const MultiPointBottomCard({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.elevation = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: ClipPath(
        clipper: MultipleRoundedPointsClipper(Sides.bottom, heightOfPoint: 20, numberOfPoints: 14),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
          ),
        child: child
      ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:revress/app_colors.dart';

class MultiPointBottomCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double elevation;

  MultiPointBottomCard({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.elevation = 4.0,
  }) : super(key: key);

  final Gradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.primary,
      AppColors.secondary,
    ],
  );

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
        clipper: MultipleRoundedPointsClipper(
            Sides.bottom, heightOfPoint: 20, numberOfPoints: 14),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage('assets/images/app_icon_white.png'),
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeat,
              scale: 5.0,// or BoxFit.contain
              opacity: 0.2, // 60% opacity
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
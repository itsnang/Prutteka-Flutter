import 'package:flutter/material.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.outlineColor.withOpacity(0.08),
      highlightColor: context.backgroundColor.withOpacity(0.1),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.disableColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }
}

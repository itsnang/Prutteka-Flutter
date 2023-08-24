import 'package:flutter/material.dart';
import 'package:prutteka_flutter/app/shared/widgets/skeleton/skeleton_widget.dart';

class SkeletonCard extends StatelessWidget {
  const SkeletonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        children: [
          const Skeleton(
            height: 120,
            width: 120,
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(
                width: 80,
              ),
              const SizedBox(height: 8),
              const Skeleton(),
              const SizedBox(height: 8),
              const Skeleton(),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Expanded(child: Skeleton()),
                  SizedBox(width: 16),
                  Expanded(child: Skeleton()),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

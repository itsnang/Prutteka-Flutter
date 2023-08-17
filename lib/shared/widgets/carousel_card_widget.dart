import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:prutteka_flutter/shared/themes/theme.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.disableColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: CachedNetworkImage(
            imageUrl: img,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                HeroIcon(
              HeroIcons.photo,
              color: context.primaryColor,
            ),
            errorWidget: (context, url, error) => HeroIcon(
              HeroIcons.exclamationCircle,
              color: context.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

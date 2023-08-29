import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:prutteka_flutter/app/shared/widgets/skeleton/skeleton_widget.dart';
import 'package:prutteka_flutter/app/shared/widgets/text_widget.dart';
import 'package:prutteka_flutter/domain/entities/event.dart';

class Map extends StatelessWidget {
  const Map({
    super.key,
    required this.locations,
  });

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    final location = locations[0];
    return Card(
      color: context.backgroundColor,
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: context.disableColor,
          )),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: context.primaryLightColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: HeroIcon(
                    HeroIcons.map,
                    style: HeroIconStyle.solid,
                    color: context.secondaryColor,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                TextWidget.title(
                  'Map',
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextWidget.subtitle(location.name),
            const SizedBox(
              height: 8,
            ),
            TextWidget.custom(
              location.address,
              fontSize: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: location.imageSrc,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Skeleton(
                    height: 180,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

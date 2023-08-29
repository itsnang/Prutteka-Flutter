import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:prutteka_flutter/app/shared/widgets/text_widget.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({
    super.key,
    required this.img,
    required this.title,
    required this.organizer,
  });

  final String img;
  final String title;
  final String organizer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: CachedNetworkImage(imageUrl: img),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextWidget.title(
            title,
            isBold: true,
          ),
          TextWidget.body(
            'Fri, Sep 8 - Sat, Sep 9',
            color: context.primaryColor,
          ),
          Row(
            children: [
              TextWidget.subtitle('From'),
              const SizedBox(
                width: 8,
              ),
              TextWidget.subtitle(organizer, color: context.secondaryColor),
            ],
          )
        ],
      ),
    );
  }
}

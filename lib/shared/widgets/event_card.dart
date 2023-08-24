import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:prutteka_flutter/shared/themes/theme.dart';
import 'package:prutteka_flutter/shared/widgets/button_widget.dart';
import 'package:prutteka_flutter/shared/widgets/text_widget.dart';

class EventCard extends StatelessWidget {
  EventCard({
    super.key,
    required this.onPressed,
    required this.img,
    required this.title,
    required this.date,
    required this.location,
    this.isLandscape = false,
    this.isActive = false,
    required this.id,
    required this.onInterested,
    this.onDelete,
    this.time,
  });
  final String img;
  final String title;
  final String date;
  String? time;
  final int id;
  final String location;
  bool isActive;
  bool isLandscape;
  Function onPressed;
  Function? onDelete;
  Function onInterested;

  @override
  Widget build(BuildContext context) {
    if (!isLandscape) {
      return SizedBox(
        height: 380,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      color: context.disableColor,
                      child: AspectRatio(
                        aspectRatio: 2 / 1,
                        child: CachedNetworkImage(
                          imageUrl: img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextWidget.body(
                              date,
                              color: context.primaryColor,
                            ),
                            SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                color: context.primaryColor,
                                endIndent: 4,
                                indent: 4,
                                thickness: 1,
                                width: 12,
                              ),
                            ),
                            TextWidget.body(
                              time!,
                              color: context.primaryColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextWidget.subtitle(
                          title,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: ButtonWidget.outline(
                  'Interested',
                  isFull: true,
                  isActive: isActive,
                  icon: const HeroIcon(HeroIcons.star),
                  onPressed: () => onInterested(),
                ),
              )
            ],
          ),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 124,
      decoration: BoxDecoration(
        color: context.disableColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 124,
                  height: 124,
                  child: ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDateWidget(context),
                    SizedBox(
                      width: 160,
                      child: TextWidget.body(
                        title,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () => onInterested,
              icon: HeroIconTheme(
                style: isActive ? HeroIconStyle.solid : HeroIconStyle.outline,
                child: HeroIcon(
                  HeroIcons.star,
                  color:
                      isActive ? context.tertiaryColor : context.outlineColor,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDateWidget(BuildContext context) {
    return Row(
      children: [
        TextWidget.caption(date, color: context.primaryColor),
        SizedBox(
          height: 20,
          child: VerticalDivider(
            color: context.primaryColor,
            endIndent: 4,
            indent: 4,
            thickness: 1,
            width: 12,
          ),
        ),
        TextWidget.caption(
          time!,
          color: context.primaryColor,
        ),
      ],
    );
  }
}

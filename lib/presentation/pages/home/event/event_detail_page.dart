import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:prutteka_flutter/app/shared/widgets/base_scaffold_widget.dart';
import 'package:prutteka_flutter/app/shared/widgets/button_widget.dart';
import 'package:prutteka_flutter/domain/entities/event.dart';
import 'package:prutteka_flutter/presentation/pages/home/event/detail.dart';
import 'package:prutteka_flutter/presentation/pages/home/event/event_header.dart';
import 'package:prutteka_flutter/presentation/pages/home/event/location_detail.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      onBackPressed: () => Get.back(),
      icon: HeroIcons.chevronLeft,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            EventHeader(
              img: event.attributes!.imageSrc,
              organizer: 'ព្រឹត្តិការណ៍ - Prutteka',
              title:
                  event.attributes?.name.en ?? event.attributes?.name.km ?? '',
            ),
            ButtonBuilder(),
            Map(
              locations: event.attributes!.locations,
            ),
            EventDetail(
                eventDetail: event.attributes?.detail.en ??
                    event.attributes?.detail.km ??
                    '')
          ],
        ),
      ),
    );
  }
}

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.disableColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ButtonWidget.round(
            'How to attend',
            isFull: true,
            icon: HeroIcon(
              style: HeroIconStyle.solid,
              HeroIcons.ticket,
              color: Get.context!.backgroundColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Row(
              children: [
                ButtonWidget.outline(
                  'interested',
                  icon: const HeroIcon(HeroIcons.star),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                ButtonWidget.outline(
                  'Share',
                  icon: const HeroIcon(HeroIcons.share),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 34,
                    vertical: 12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

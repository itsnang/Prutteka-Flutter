import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:heroicons/heroicons.dart';
import 'package:prutteka_flutter/app/services/utilities/url_launcher.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:prutteka_flutter/app/shared/widgets/text_widget.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({
    super.key,
    required this.eventDetail,
  });
  final String eventDetail;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: context.disableColor,
          )),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: context.outlineColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12)),
                  child: HeroIcon(
                    HeroIcons.checkBadge,
                    style: HeroIconStyle.solid,
                    color: context.outlineColor,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                TextWidget.title(
                  'Event Detail',
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextWidget.custom(eventDetail).toHtmlText(onTap: (
              String? url,
              RenderContext context,
              Map<String, String> attributes,
              _,
            ) {
              if (url != null) UrlUtil.launchUrl(url);
            })
          ],
        ),
      ),
    );
  }
}

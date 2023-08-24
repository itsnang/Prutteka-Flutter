import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/controllers/event/event_controller.dart';
import 'package:prutteka_flutter/pages/home/carousel.dart';
import 'package:prutteka_flutter/app/services/helper/convert_date.dart';
import 'package:prutteka_flutter/shared/widgets/event_card.dart';
import 'package:prutteka_flutter/shared/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final EventController controller = Get.find();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchData();
        _scrollController.addListener(_scrollListener);
      },
      didUpdateWidget: (old, newState) {},
      builder: (_) {
        return Scaffold(
            body: Column(
          children: [
            const CarouselWidget(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                itemCount: controller.events.length,
                itemBuilder: (context, index) {
                  final event = controller.events[index];

                  final date =
                      ConvertDate.formatDate(event.attributes?.date.startDate);

                  final time = ConvertDate.formatTime(
                    event.attributes?.times[0].startTime,
                  );
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: EventCard(
                      onPressed: () {},
                      img: event.attributes?.imageSrc ?? '',
                      title: event.attributes?.name.en ??
                          event.attributes?.name.km ??
                          '',
                      date: date,
                      isLandscape: true,
                      location: '',
                      id: 12,
                      onInterested: () {},
                      time: time,
                    ),
                  );
                },
              ),
            ),
          ],
        ));
      },
    );
  }

  _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      controller.loadMore();
      print('=====> Listenelr');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:prutteka_flutter/app/shared/widgets/skeleton/skeleton_card_widget.dart';
import 'package:prutteka_flutter/presentation/controllers/event/event_controller.dart';
import 'package:prutteka_flutter/presentation/pages/home/carousel.dart';
import 'package:prutteka_flutter/app/services/helper/convert_date.dart';
import 'package:prutteka_flutter/app/shared/widgets/event_card.dart';
import 'package:prutteka_flutter/app/shared/widgets/text_widget.dart';

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
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return Scaffold(
            body: Column(
          children: [
            const CarouselWidget(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => controller.onRefresh(),
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: controller.events.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.events.length) {
                      if (controller.loading.value) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              SkeletonCard(),
                              SkeletonCard(),
                              SkeletonCard(),
                            ],
                          ),
                        );
                      } else if (controller.ended.value) {
                        return Center(
                          child: TextWidget.body(
                            'No More Events',
                            color: context.primaryColor,
                          ),
                        );
                      }
                    }

                    final event = controller.events[index];

                    final date = ConvertDate.formatDate(
                        event.attributes?.date.startDate);

                    final time = ConvertDate.formatTime(
                      event.attributes?.times[0].startTime,
                    );
                    return EventCard(
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
                    );
                  },
                ),
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
    }
  }
}

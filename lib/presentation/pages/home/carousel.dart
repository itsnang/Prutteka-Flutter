import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/constants/dummy_data.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:prutteka_flutter/app/shared/widgets/carousel_card_widget.dart';
import 'package:prutteka_flutter/app/shared/widgets/text_widget.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  var _selectIndex = 0;
  Timer? _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_selectIndex < imageList.length - 1) {
        _selectIndex++;
      } else {
        _selectIndex = 0;
      }
      _pageController.animateToPage(
        _selectIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 8,
          ),
          child: TextWidget.title(
            'Most Views Events',
            isBold: true,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          height: 180,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectIndex = index;
              });
            },
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return CarouselCard(
                img: imageList[index].img,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              imageList.length,
              (index) => _indicatorWidget(
                isActive: _selectIndex == index ? true : false,
              ),
            )
          ],
        ),
      ],
    );
  }
}

Widget _indicatorWidget({required bool isActive}) {
  return AnimatedContainer(
    duration: const Duration(
      milliseconds: 300,
    ),
    margin: const EdgeInsets.symmetric(
      horizontal: 4,
    ),
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      color: isActive
          ? Get.context!.secondaryColor
          : Get.context!.primaryLightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/constants/dummy_data.dart';
import 'package:prutteka_flutter/shared/themes/theme.dart';
import 'package:prutteka_flutter/shared/widgets/carousel_card_widget.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  var _selectIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_selectIndex < imageList.length - 1) {
        _selectIndex++;
      } else {
        _selectIndex = 0;
      }
      _pageController.animateToPage(
        _selectIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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

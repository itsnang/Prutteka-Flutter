import 'package:flutter/material.dart';
import 'package:prutteka_flutter/pages/home/carousel.dart';
import 'package:prutteka_flutter/shared/widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
        const CarouselWidget()
      ],
    ));
  }
}

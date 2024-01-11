import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Home Section
class HomeSection extends StatelessWidget {
  /// Constructor
  const HomeSection(
      {required this.controller,
      required this.title,
      required this.items,
      this.showMore = false,
      this.height = 150,
      super.key});

  /// Page Controller
  final PageController controller;

  /// Title
  final String title;

  /// Items
  final List<Widget> items;

  /// Container Height
  final double? height;

  /// Show More
  final bool showMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              if (showMore) ...[
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text('See All 15',
                            style: Theme.of(context).textTheme.bodyLarge)),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    )
                  ],
                )
              ]
            ],
          ),
        ),
        SizedBox(
          height: height,
          child: PageView.builder(
              padEnds: false,
              controller: controller,
              itemCount: items.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: items[index],
                  )),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SmoothPageIndicator(
              effect:
                  WormEffect(activeDotColor: Theme.of(context).primaryColor),
              controller: controller,
              count: items.length),
        ))
      ],
    );
  }
}

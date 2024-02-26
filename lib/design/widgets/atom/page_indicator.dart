import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PageIndicator extends StatefulWidget {
  final int length;
  final int activeIndex;

  const PageIndicator({
    super.key,
    required this.length,
    required this.activeIndex,
  });

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(widget.length, (index) {
          return Row(
            children: [
              CircleAvatar(
                radius: 8,
                backgroundColor: widget.activeIndex == index
                    ? AppColors.primary
                    : AppColors.grey200,
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          );
        })
      ],
    );
  }
}

import 'package:flutter/material.dart';

class VerticalTimeline extends StatelessWidget {
  final int totalDots;
  final List<int> filledDots; // Индексы точек, которые закрашены
  final double dotSize;
  final double lineWidth;
  final Color lineColor;
  final Color dotColor;
  final Color filledDotColor;

  const VerticalTimeline({
    super.key,
    this.totalDots = 10,
    this.filledDots = const [0, 9],
    this.dotSize = 20.0,
    this.lineWidth = 4.0,
    this.lineColor = Colors.black,
    this.dotColor = Colors.white,
    this.filledDotColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Линия по центру
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: lineWidth,
                    color: lineColor,
                  ),
                ),
              ),

              // Круги
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(totalDots, (index) {
                  final isFilled = filledDots.contains(index);
                  return Container(
                    width: dotSize,
                    height: dotSize,
                    decoration: BoxDecoration(
                      color: isFilled ? filledDotColor : dotColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: lineColor, width: 2),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}

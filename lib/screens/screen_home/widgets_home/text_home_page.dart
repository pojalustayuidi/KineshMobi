import 'package:flutter/material.dart';

class TextHomePage extends StatelessWidget {
  const TextHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Введите или выберите из предложенного списка свою остановку',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFF667085),
                fontFamily: 'Franklin_Gothic_Medium',
                fontSize: 16,
              ),
            )
          ]),
    );
  }
}

class TextMarshrut extends StatelessWidget {
  const TextMarshrut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Выберите маршрут:',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Franklin_Gothic_Medium'),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Для того чтобы посмотреть более подробнее маршрут нажмите на него',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color(0xFF667085),
              fontSize: 12),
        )
      ],
    );
  }
}

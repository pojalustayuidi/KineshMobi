// search_state.dart
import 'package:flutter/material.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';

import 'simple_stop_search_field.dart'; // Или твой SearchField

class SearchState extends StatelessWidget {
  final List<Stop> stops;
  final Stop? selectedStop;
  final ValueChanged<Stop?> onChanged;
  final double width;

  const SearchState({
    super.key,
    required this.stops,
    required this.selectedStop,
    required this.onChanged,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок поиска
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Text(
                    'ПОИСК ОСТАНОВКИ',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Franklin_Gothic_Medium',
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Начните вводить название остановки, чтобы увидеть доступные варианты',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Franklin_Gothic_Medium',
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),
        SimpleStopSearchField(
          stops: stops,
          selectedStop: selectedStop,
          onChanged: onChanged,
          width: width,
        ),
      ],
    );
  }
}
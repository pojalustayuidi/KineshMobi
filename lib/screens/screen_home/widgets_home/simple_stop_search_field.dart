// simple_stop_search_field.dart
import 'package:flutter/material.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';

class SimpleStopSearchField extends StatefulWidget {
  final List<Stop> stops;
  final Stop? selectedStop;
  final ValueChanged<Stop?> onChanged;
  final double? width;

  const SimpleStopSearchField({
    super.key,
    required this.stops,
    required this.selectedStop,
    required this.onChanged,
    this.width,
  });

  @override
  State<SimpleStopSearchField> createState() => _SimpleStopSearchFieldState();
}

class _SimpleStopSearchFieldState extends State<SimpleStopSearchField> {
  late TextEditingController _controller;
  List<Stop> _filteredStops = [];
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.selectedStop != null) {
      _controller.text = widget.selectedStop!.name;
    }
    _filteredStops = [];
  }

  void _filterStops(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredStops = [];
        _showSuggestions = false;
      });
      return;
    }

    final filtered = widget.stops.where((stop) {
      return stop.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredStops = filtered.take(10).toList();
      _showSuggestions = filtered.isNotEmpty;
    });
  }

  void _selectStop(Stop stop) {
    _controller.text = stop.name;
    widget.onChanged(stop);
    setState(() {
      _showSuggestions = false;
    });
    FocusScope.of(context).unfocus();
  }

  void _clearStop() {
    _controller.clear();
    widget.onChanged(null);
    setState(() {
      _filteredStops = [];
      _showSuggestions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Например: "Почта" или "Вокзал"',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              // Значок геолокации слева
              prefixIcon: const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
                onPressed: _clearStop,
              )
                  : null,
            ),
            onChanged: (value) {
              _filterStops(value);
              if (value.isEmpty) {
                widget.onChanged(null);
              }
            },
            onTap: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  _showSuggestions = true;
                });
              }
            },
          ),

          if (_controller.text.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(
                'Начните вводить название остановки',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                  fontFamily: 'Franklin_Gothic_Medium',
                ),
              ),
            ),

          if (_showSuggestions && _filteredStops.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: Colors.grey[200]!),
              ),
              constraints: const BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _filteredStops.length,
                itemBuilder: (context, index) {
                  final stop = _filteredStops[index];
                  return ListTile(
                    title: Text(
                      stop.name,
                      style: const TextStyle(
                        fontFamily: 'Franklin_Gothic_Medium',
                      ),
                    ),
                    onTap: () => _selectStop(stop),
                  );
                },
              ),
            ),

          if (_controller.text.isNotEmpty && _filteredStops.isEmpty)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.grey[500],
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Остановка не найдена. Попробуйте ввести другое название',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontFamily: 'Franklin_Gothic_Medium',
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MyGenderWidget extends StatefulWidget {
  final String gender;
  final String userId;
  final VoidCallback? onGenderChanged;

  const MyGenderWidget({
    super.key,
    required this.gender,
    required this.userId,
    this.onGenderChanged,
  });

  @override
  State<MyGenderWidget> createState() => _MyGenderWidgetState();
}

class _MyGenderWidgetState extends State<MyGenderWidget> {
  late String _currentGender;

  @override
  void initState() {
    super.initState();
    _currentGender = widget.gender;
  }


  Future<void> _showGenderDialog() async {
    String? newGender = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String? selectedGender = _currentGender;
        return AlertDialog(
          title: const Text('Выберите пол'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: const Text('Мужской'),
                    value: 'male',
                    groupValue: selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Женский'),
                    value: 'female',
                    groupValue: selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, selectedGender),
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );

    if (newGender != null && newGender != _currentGender) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
          'gender': newGender,
          'updateAt': DateTime.now().toIso8601String(),
        });
        setState(() {
          _currentGender = newGender;
        });
        if (widget.onGenderChanged != null) {
          widget.onGenderChanged!();
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пол успешно обновлён')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при обновлении пола: $e')),
        );
      }
    }
  }

  String _displayGender(String gender) {
    switch (gender) {
      case 'male':
        return 'Мужской';
      case 'female':
        return 'Женский';
      default:
        return 'Не указан';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Пол",
                style: TextStyle(
                  color: Color(0xFF667085),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _displayGender(_currentGender),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          TextButton(
            onPressed: _showGenderDialog,
            child: const Text(
              'Изменить',
              style: TextStyle(color: Color(0xFF344E41)),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyNameWidget extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String userName;
  final Function(String, String)
      onNameChanged; // Callback для обновления имени и фамилии

  const MyNameWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.onNameChanged,
    required this.userName,
  });

  @override
  State<MyNameWidget> createState() => _MyNameWidgetState();
}

class _MyNameWidgetState extends State<MyNameWidget> {
  late String _firstName;
  late String _lastName;

  @override
  void initState() {
    super.initState();
    _firstName = widget.firstName;
    _lastName = widget.lastName;
  }

  bool _isLoading = false;

  void _showEditNameOverlay(BuildContext context) {
    TextEditingController firstNameController =
        TextEditingController(text: _firstName);
    TextEditingController lastNameController =
        TextEditingController(text: _lastName);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Изменить имя',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context); // Закрыть оверлей
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Имя'),
              const SizedBox(height: 6),
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Фамилия'),
              const SizedBox(height: 6),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          setState(() => _isLoading = true);
                          try {
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(widget.userName)
                                .update({
                              'firstName': firstNameController.text,
                              'lastName': lastNameController.text,
                            });
                            setState(() {
                              _firstName = firstNameController.text;
                              _lastName = lastNameController.text;
                            });
                            widget.onNameChanged(
                              _firstName,
                              _lastName,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Данные успешно обновлены'),
                              ),
                            );
                            Navigator.pop(context);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Ошибка при обновлении: $e'),
                              ),
                            );
                          } finally {
                            setState(()=> _isLoading = false);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF344E41),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.red,
                        )
                      : const Text(
                          'Сохранить',
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
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
              Text(
                "Ваше имя",
                style: TextStyle(
                  color: const Color(0xFF667085),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$_firstName $_lastName',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              _showEditNameOverlay(context); // Показать оверлей
            },
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

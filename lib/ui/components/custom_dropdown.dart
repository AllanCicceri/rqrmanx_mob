import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<Map<String, String>> items;
  final String label;
  final Function selectedValue;

  CustomDropdown(
      {super.key,
      required this.items,
      required this.label,
      required this.selectedValue});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String _selectedDifficulty;

  @override
  void initState() {
    super.initState();
    _selectedDifficulty =
        widget.items.first['value']!; // Inicializando com a primeira opção
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(color: Colors.grey[400]),
        ),
        DropdownButton(
            value: _selectedDifficulty,
            elevation: 10,
            items: widget.items
                .map<DropdownMenuItem<String>>((Map<String, String> item) {
              return DropdownMenuItem<String>(
                value: item['value'],
                child: Text(item['label'] ?? '',
                    style: TextStyle(color: Colors.grey[600])),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedDifficulty = newValue!;
              });
              widget.selectedValue(int.parse(newValue!));
            }),
      ],
    );
  }
}

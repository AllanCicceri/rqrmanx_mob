import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String label;

  const CustomDropdown({super.key, required this.items, required this.label});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String _selectedDifficulty;

  @override
  void initState() {
    super.initState();
    _selectedDifficulty =
        widget.items.first; // Inicializando com a primeira opção
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
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: Colors.grey[600])),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedDifficulty = newValue!;
              });
            }),
      ],
    );
  }
}

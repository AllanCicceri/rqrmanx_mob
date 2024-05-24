import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<Map<String, String>> items;
  final String label;
  final Function(int) selectedValue;
  final int selectedItem;

  CustomDropdown({
    super.key,
    required this.items,
    required this.label,
    required this.selectedValue,
    required this.selectedItem,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem.toString();
  }

  @override
  void didUpdateWidget(covariant CustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedItem != int.parse(_selectedItem)) {
      setState(() {
        _selectedItem = widget.selectedItem.toString();
      });
    }
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
        DropdownButton<String>(
          value: _selectedItem,
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
              _selectedItem = newValue!;
            });
            widget.selectedValue(int.parse(newValue!));
          },
        ),
      ],
    );
  }
}

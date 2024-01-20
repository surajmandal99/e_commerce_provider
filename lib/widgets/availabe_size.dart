import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {
  final String size;
  const AvailableSize({super.key, required this.size});

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(
            right: 16,
          ),
          width: 40,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: _isSelected ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.red)),
          child: Text(
            widget.size,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        
      );
}

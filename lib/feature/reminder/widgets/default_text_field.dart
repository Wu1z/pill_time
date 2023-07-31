import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextInputType? type;
  final TextEditingController controller;

  const DefaultTextField({super.key, this.label, this.type, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFC),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFE7E9ED),
              width: 1.5,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              maxLines: null,
              keyboardType: type,
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: hintText,
                label: label != null ? Text(label!) : null,
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

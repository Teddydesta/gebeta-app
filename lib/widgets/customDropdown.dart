import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final titleText;
  final hintText;
  final controller;
  final validator;
  final value;
  final onChange;
  final items;
  const CustomDropdown(
      {Key? key,
      this.titleText,
      this.value,
      this.onChange,
      this.items,
      this.hintText,
      this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 3, bottom: 6.0),
        child: Text(
          titleText,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      InputDecorator(
          decoration: InputDecoration(
            enabled: true,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.orange, width: 3)),
            contentPadding: EdgeInsets.only(left: 12, right: 12),
          ),
          child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
            isExpanded: true,
            value: value,
            hint: Text(hintText, style: TextStyle(color: Colors.black45)),
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontSize: 15),
            onChanged: onChange,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )))
    ]);
  }
}

import 'package:flutter/material.dart';

class RadioPicker extends StatefulWidget {
  const RadioPicker({super.key});

  @override
  State<RadioPicker> createState() => _RadioPickerState();
}

List<String> options = ['Active', 'Not Active'];

class _RadioPickerState extends State<RadioPicker> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            // First Option
            Row(
              children: [
                Radio(
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
                const Text('Active'),
              ],
            ),
            const SizedBox(width: 20), 
            // Second Option
            Row(
              children: [
                Radio(
                  value: options[1],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
                const Text('Not Active'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

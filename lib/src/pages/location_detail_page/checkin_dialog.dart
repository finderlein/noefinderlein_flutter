import 'package:flutter/material.dart';

class CheckInDialog extends StatefulWidget {
  const CheckInDialog({Key? key}) : super(key: key);

  @override
  State<CheckInDialog> createState() => CheckInDialogState();
}

class CheckInDialogState extends State<CheckInDialog> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDate = now.subtract(const Duration(days: 20));
    return AlertDialog(
        title: const Text('Für welchen Tag abhaken?'),
        content: SingleChildScrollView(
            child: ListBody(children: [
          Text('Gesparter Betrag:'),
          // CalendarDatePicker(
          //   firstDate: firstDate,
          //   initialDate: now,
          //   lastDate: now,
          //   onDateChanged: (DateTime value) {},
          // ),
          Text('€')
        ])));
  }
}

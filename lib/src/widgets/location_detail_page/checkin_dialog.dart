import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../database/tables/location.dart';

class CheckInDialog extends StatefulWidget {
  const CheckInDialog(
      {Key? key, required this.location, required this.callback})
      : super(key: key);

  final Location location;
  final Function callback;
  @override
  State<CheckInDialog> createState() => CheckInDialogState();
}

class CheckInDialogState extends State<CheckInDialog> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController amountinput = TextEditingController();

  late DateTime now;
  late DateTime firstDate;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    firstDate = now.subtract(const Duration(days: 365));
    dateinput.text = DateFormat('yyyy-MM-dd').format(now);
    amountinput.text = widget.location.savingsAdult;
  }

  @override
  void dispose() {
    dateinput.dispose();
    amountinput.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final amount = double.tryParse(amountinput.value.text);
    if (amount != null) {
      // return null if the text is valid
      return null;
    } else {
      return 'Value is not a decimal';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Für welchen Tag abhaken?'),
        // actions: [],
        scrollable: true,
        content: ValueListenableBuilder(
            valueListenable: amountinput,
            builder: (context, TextEditingValue value, __) {
              return Column(children: [
                TextField(
                    controller:
                        dateinput, //editing controller of this TextField
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: firstDate,
                        initialDate: now,
                        lastDate: now,
                      );
                      if (pickedDate != null) {
                        // print(
                        //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        // print(
                        //     formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        // print("Date is not selected");
                      }
                    }),
                // Divider(),
                // CalendarDatePicker(
                //   firstDate: firstDate,
                //   initialDate: now,
                //   lastDate: now,
                //   onDateChanged: (DateTime value) {},
                // ),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: TextField(
                      controller: amountinput,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.euro),
                          border: const OutlineInputBorder(),
                          // prefixText: '€ ',
                          labelText: 'Enter saved amount',
                          errorText: _errorText),
                      keyboardType: TextInputType.number,
                    )),

                Row(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.secondary)),
                        onPressed: () {
                          setState(() {
                            var value = double.tryParse(amountinput.text);
                            var valueS =
                                double.tryParse(widget.location.savingsAdult);
                            if (value == null || valueS == null) {
                              amountinput.text = valueS.toString();
                            } else {
                              amountinput.text = (value + valueS).toString();
                            }
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Add Adult\n€ ${widget.location.savingsAdult}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ))),
                    const Spacer(),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.secondary)),
                        onPressed: () {
                          setState(() {
                            var value = double.tryParse(amountinput.text);
                            var valueS =
                                double.tryParse(widget.location.savingsChild);
                            if (value == null || valueS == null) {
                              amountinput.text = valueS.toString();
                            } else {
                              amountinput.text = (value + valueS).toString();
                            }
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Add Child\n€ ${widget.location.savingsChild}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            )))
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      children: [
                        TextButton(
                          child: Text('Set to € 0',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface)),
                          onPressed: () {
                            setState(() {
                              amountinput.text = '0';
                            });
                          },
                        ),
                        const Spacer(),
                        ElevatedButton(
                            style: _errorText != null
                                ? null
                                : ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                            onPressed: _errorText != null
                                ? null
                                : () {
                                    var amount =
                                        double.tryParse(amountinput.value.text);
                                    var date = dateinput.value.text;
                                    if (amount != null) {
                                      widget.callback(
                                          amount: amount, date: date);
                                      Navigator.of(context).pop();
                                    }
                                  },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: _errorText != null
                                      ? null
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                ),
                              ),
                            )),
                      ],
                    ))
              ]);
            }));
  }
}

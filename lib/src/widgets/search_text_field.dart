import 'package:flutter/material.dart';

import '../localization/app_localizations_context.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true, //Display the keyboard when TextField is displayed
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 20,
      ),
      onChanged: onChanged,
      // textInputAction:
      //     TextInputAction.search, //Specify the action button on the keyboard
      decoration: InputDecoration(
        //Style of TextField
        enabledBorder: UnderlineInputBorder(
            //Default TextField border
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
        focusedBorder: UnderlineInputBorder(
            //Borders when a TextField is in focus
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
        hintText: context
            .loc.search, //Text that is displayed when nothing is entered.
        hintStyle: TextStyle(
          //Style of hintText
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 20,
        ),
      ),
    );
  }
}

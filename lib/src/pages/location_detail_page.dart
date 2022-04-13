import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class LocationDetailsPage extends StatelessWidget {
  const LocationDetailsPage({Key? key}) : super(key: key);

  static const routeName = '/location/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
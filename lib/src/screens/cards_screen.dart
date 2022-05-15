// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import '../database/database_helper.dart';
// import '../database/tables/noecard.dart';
// import 'dart:developer' as developer;
// import 'package:qr_flutter/qr_flutter.dart';
// import '../localization/app_localizations_context.dart';
// import 'barcode_scanner.dart';

// class CardsScreen extends StatefulWidget {
//   const CardsScreen({Key? key}) : super(key: key);

//   static const routeName = '/cards';

//   @override
//   State<CardsScreen> createState() => _CardsScreenState();
// }

// /// Displays detailed information about a SampleItem.
// class _CardsScreenState extends State<CardsScreen> {
//   late Future<List<Noecard>> _alcards;

//   @override
//   void initState() {
//     super.initState();
//     _alcards = DatabaseHelper.getAllCards();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           foregroundColor: Theme.of(context).colorScheme.onPrimary,
//           title: Text(context.loc.mycardsTitle),
//           // actions: [],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // Navigator.of(context).push(MaterialPageRoute(
//             //   builder: (context) => const BarcodeScannerWithoutController(),
//             // ));
//           },
//           child: const Icon(MdiIcons.plus),
//         ),
//         body: FutureBuilder(
//           future: _alcards,
//           builder:
//               (BuildContext context, AsyncSnapshot<List<Noecard>> snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.none:
//                 return const Center(child: CircularProgressIndicator());
//               case ConnectionState.active:
//               case ConnectionState.waiting:
//                 developer.log('waiting', name: 'cards_screen.dart');
//                 return const Center(child: CircularProgressIndicator());
//               case ConnectionState.done:
//                 developer.log('done', name: 'cards_screen.dart');
//                 List<Noecard>? cards = snapshot.data;
//                 if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 }
//                 return showCards(context: context, cards: cards);
//             }
//           },
//         ));
//   }

//   Widget showCards(
//       {required BuildContext context, required List<Noecard>? cards}) {
//     if (cards == null || cards.isEmpty) {
//       return Center(
//           child: Text(
//         context.loc.noCard,
//         style: const TextStyle(fontSize: 20),
//       ));
//     }

//     return ListView.builder(
//         itemCount: cards.length,
//         itemBuilder: (context, i) {
//           return singleCard(context: context, card: cards[i]);
//         });
//   }

//   Widget singleCard({required BuildContext context, required Noecard card}) {
//     return ExpansionTile(
//       title: Text(card.name),
//       children: [
//         QrImage(
//           data: "1234567890",
//           version: QrVersions.auto,
//           size: 200.0,
//         ),
//       ],
//     );
//   }
// }

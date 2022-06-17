import 'package:flutter/material.dart';
import 'package:food_expiration_date_tracking/inventory_screen.dart';

import 'db.dart';
import 'items.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var db = DB();
  // await db.addNewItem(
  //     Item(
  //         theId: 1,
  //         theName: 'test',
  //         // thePurchasedDate: DateTime.parse('2000-01-02'),
  //         theExpirationDate: DateTime.parse('2000-01-02')
  //     )
  // );
  // print(await db.getItem());
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   primaryColor: kDarkCardColor,
      //   scaffoldBackgroundColor: kBackgroundColor,
      // ),
      home: InventoryScreen(),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:food_expiration_date_tracking/add_item_screen.dart';
import 'package:food_expiration_date_tracking/constaint.dart';
import 'package:food_expiration_date_tracking/db.dart';

import 'base_card.dart';
import 'item_list.dart';
import 'items.dart';

class InventoryScreen extends StatefulWidget {


  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  DateTime today = DateTime.now();
  var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL",
  "AUG", "SEPT", "OCT", "NOV", "DEC"];
  String sortType = 'MFG';
  var db = DB();
  void addItem(Item newItem) async {
    await db.addNewItem(newItem);
    setState(() {});
  }

  void deleteItem(Item item) async {
    await db.deleteItem(item);
    setState(() {

    });
  }
  void deleteAll() async {
    await db.deleteAll();
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Text("EXPIRY DATES TRACKING",
          style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: kBigTextColor,
        ),),

      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          BaseCard(
            theChild: Text("Today , ${today.day} ${monthNames[today.month-1]} ${today.year}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
              color: kMainColor)
            ), theColor: kBackgroundColor,

          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.start,

                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,child: Row(
                          children: [

                            Container( child: Text("All items ",style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: kMainColor),),),
                            Container(child:
                              DropdownButton<String>(
                                icon: Icon(Icons.sort_rounded),
                                onChanged: (String? newSort) {
                                  setState(() {
                                    sortType = newSort!;
                                  });
                                },
                                items: <String>['MFG', 'EXP', 'BBF']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )),

                    Container(child:
                      BaseCard(
                        theChild: Text("Clear all",style: const TextStyle(color: kMainColor)),
                        theColor: kBackgroundColor,
                        theOnTap: deleteAll,
                      ),
                    )
                  ],
                )

            ),
          ),

            // child: Scrollbar(
            //   trackVisibility: true,

          ItemList(addFunction: addItem, deleteFunction: deleteItem, sortType: sortType,)


          // ),

          // Container(
          //     //
          //
          //     child: BottomAppBar(
          //       child: IcButton(
          //         theIconData :(Icons.add),
          //         theColor: kButtonColor ,
          //         theOnPressed: (){
          //           Navigator.push(
          //           context,
          //             MaterialPageRoute(
          //             builder: (context) =>
          //             AddItemScreen(addFunction: addItem),
          //             )
          //           );
          //        }
          //   ),
          //     ),
          // )

        ]

      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: (){
          Navigator.push(
              context,
                MaterialPageRoute(
                builder: (context) =>
                AddItemScreen(addFunction: addItem),
                )
              );},
          child: Icon(Icons.add),
          )

    );
  }
}



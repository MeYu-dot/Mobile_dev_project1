
import 'package:flutter/material.dart';

import 'base_card.dart';
import 'constaint.dart';
import 'items.dart';

class AddItemScreen extends StatefulWidget {
  final Function addFunction;
  AddItemScreen({required this.addFunction, Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  var nameController= TextEditingController();

  var _MFG;
  var _EXP;
  var _BBF;

  var purDateController= TextEditingController();
  String getMFG() {
    if (_MFG == null) {
      return 'Select Date';
    }
    else {
      return '${_MFG.day}/${_MFG.month}/${_MFG.year}';
    }
  }
  String getEXP() {
    if (_EXP == null) {
      return 'Select Date';
    }
    else {
      return '${_EXP.day}/${_EXP.month}/${_EXP.year}';
    }
  }
  String getBBF() {
    if (_BBF == null) {
      return 'Select Date';
    }
    else {
      return '${_BBF.day}/${_BBF.month}/${_BBF.year}';
    }
  }
  Future _selectDate(BuildContext context, int type) async {
    final currentDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10));
    if (pickedDate == null) return;
    // if (pickedDate != null && pickedDate != currentDate) {
    // setState() {
    //   _selectedDate = pickedDate;
    // }
    if (type == 0) {
      setState(() => _MFG = pickedDate);
    }
    if (type == 1) {
      setState(() => _EXP = pickedDate);
    }
    if (type == 2) {
      setState(() => _BBF = pickedDate);
    }

    // }
    print("Selected Date"+pickedDate.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(
          color: kMainColor, //change your color here
        ),
        title: const Text('Add new item',
          style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: kMainColor,),
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: BaseCard(
              theColor: kBrightCardColor,
              theChild: Text('Item Name', style: TextStyle(fontSize: 20, fontFamily: 'Raleway',fontWeight: FontWeight.bold,color: kMainColor)),
            ),
          ),
          Container(
              child: BaseCard(
                theColor: kBrightCardColor,
                theChild: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Item Name:',
                  ),
                ),
              )
          ),
          Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Manufactured Date", style: TextStyle(fontSize: 20, fontFamily: 'Raleway',fontWeight: FontWeight.bold, color: kMainColor)),
                  // SizedBox(width: 60,),
                  BaseCard(
                    // theChild: TextField(
                    //   controller: purDateController,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     hintText: 'Purchased Date',
                    //   ),
                    // ),
                    theChild: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kMainColor),
                      onPressed: () => _selectDate(context, 0),
                      child: Text(getMFG()),
                    ),


                    theColor: Colors.white,
                  ),
                ],
              )
          ),
          Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Expiration Date", style: TextStyle(fontSize: 20, fontFamily: 'Raleway',fontWeight: FontWeight.bold, color: kMainColor)),
                  // SizedBox(width: 60,),
                  BaseCard(

                    theChild: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: kMainColor),
                        onPressed: () => _selectDate(context, 1),
                        child: Text(getEXP()),
                    ),


                    theColor: Colors.white,
                  ),
                ],
              )
          ),

          Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Best Before", style: TextStyle(fontSize: 20, fontFamily: 'Raleway',fontWeight: FontWeight.bold, color: kMainColor)),
                  // SizedBox(width: 60,),
                  BaseCard(
                    // theChild: TextField(
                    //   controller: purDateController,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     hintText: 'Purchased Date',
                    //   ),
                    // ),
                    theChild: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kMainColor),
                      onPressed: () => _selectDate(context, 2),
                      child: Text(getBBF()),
                    ),


                    theColor: Colors.white,
                  ),
                ],
              )
          ),
          // Container(
          //   child: const BaseCard(
          //     theColor: Colors.white,
          //     theChild: Text("test"),
          //     // theOnTap: () {
          //     //   setState() {
          //     //
          //     //   }
          //     // },
          //   ),
          //
          // ),
          // ),

        ],

      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          backgroundColor: kMainColor,
          onPressed: (){
            var newItem = Item(
              theName: nameController.text,
              theManufacturedDate: _MFG,
              theExpirationDate: _EXP,

              theBestBefore: _BBF
              // thePurchasedDate: DateTime.parse(purDateController.text),

            );
            widget.addFunction(newItem);
            print(newItem);
            print("item added");

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) =>
            //           InventoryScreen(),
            //     )
            Navigator.pop(context);
            // );

          },
        )
    );

  }
}

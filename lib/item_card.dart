import 'package:flutter/material.dart';
import 'package:food_expiration_date_tracking/base_card.dart';

import 'constaint.dart';

import 'items.dart';
class ItemCard extends StatefulWidget {

  final int theId;
  final String theName;
  final DateTime? theBestBefore;
  final DateTime? theExpirationDate;
  final DateTime theManufacturedDate;
  final Function addFunction;
  final Function deleteFunction;
  const ItemCard({
    required this.theId,
    required this.theName,
    // this.thePurchasedDate,
    this.theExpirationDate,
    required this.theManufacturedDate,
    this.theBestBefore,
    required this.addFunction,
    required this.deleteFunction,
    Key? key}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    print(from);
    print(to);
    return (to.difference(from).inHours / 24).round();
  }
  String printDate(DateTime? date) {
    if (date == null) {
      return "-";
    }
    else {
      return date.day.toString()+'/'+
          date.month.toString()+'/'+
          date.year.toString();
    }
  }
  String printDateLeft(DateTime? date) {
    if (date == null) {
      return "-";

    }
    else {
      return daysBetween(DateTime.now(), date).toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    var tmp = Item(theId: widget.theId, theName: widget.theName,

        theExpirationDate: widget.theExpirationDate,
        theManufacturedDate: widget.theManufacturedDate,
        theBestBefore: widget.theBestBefore);
    return Container(
      child: BaseCard(
        theColor: kBrightCardColor,
        theChild: Row(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    // child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [

                            Text('Item name ', style: TextStyle(fontSize: 17, fontFamily: 'Raleway', color: kTextColor)),
                            SizedBox(width: 40,),
                            Text(widget.theName, style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold,color: kMainColor),),
                          ],
                        ),
                      ),
                    // ),

                ),
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('MFG: ', style: TextStyle(fontSize: 15, fontFamily: 'Raleway', color: kTextColor)),
                          SizedBox(width: 20,),
                          Text(printDate(widget.theManufacturedDate),
                              style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold, color: kMainColor)),
                          // Text(widget.theExpirationDate.month.toString()+'/', style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
                          // Text(widget.theExpirationDate.year.toString(), style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold))
                        ],
                      ),
                    )),
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('EXP: ', style: TextStyle(fontSize: 15, fontFamily: 'Raleway', color: kTextColor)),
                          SizedBox(width: 20,),
                          Text(printDate(widget.theExpirationDate),
                              style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold, color: kMainColor)),
                          // Text(widget.theExpirationDate.month.toString()+'/', style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
                          // Text(widget.theExpirationDate.year.toString(), style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold))
                        ],
                      ),
                    )),
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('BBF: ', style: TextStyle(fontSize: 15, fontFamily: 'Raleway', color: kTextColor)),
                          SizedBox(width: 20,),
                          Text(printDate(widget.theBestBefore),
                              style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold, color: kMainColor)),
                          // Text(widget.theExpirationDate.month.toString()+'/', style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
                          // Text(widget.theExpirationDate.year.toString(), style: TextStyle(fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold))
                        ],
                      ),
                    )),


              ],
            ),
            Spacer(flex: 2,),
            Container(

              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Text(printDateLeft(widget.theExpirationDate), style: TextStyle(fontSize: 25, fontFamily: 'Raleway', fontWeight: FontWeight.bold, color:kMainColor)),
                  Text("  Days left", style: TextStyle(fontSize: 15, fontFamily: 'Raleway', color: kTextColor))
                ],
              ),
            ),

            IconButton(
                color: Colors.red,
                onPressed: () => widget.deleteFunction(tmp),
                icon: const Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}

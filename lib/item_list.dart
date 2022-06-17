import 'package:flutter/material.dart';
import 'package:food_expiration_date_tracking/constaint.dart';
import 'package:food_expiration_date_tracking/item_card.dart';
import 'db.dart';
class ItemList extends StatelessWidget {
  final Function addFunction;
  final Function deleteFunction;
  final String sortType;
  ItemList({
    required this.sortType,
    required this.addFunction,
    required this.deleteFunction,
    Key? key}) : super(key: key);

  var db = DB();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: db.getItem(sortType),
            initialData: const [],
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              print(snapshot);
              if (!snapshot.hasData) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              var data = snapshot.data;
              if (sortType == 'EXP') {

              }
              var datalength = data!.length;
              return datalength == 0 ?
              const Center(child: Text("no data", style: TextStyle(color: kTextColor),),) :
              // SizedBox(
              //   SingleChildScrollView(
                  // isAlwaysShown: true,
                  // trackVisibility: true,
                  // controller: _controllerOne,
                  ListView.builder(
                      // physics:
                    // controller: _controllerOne,
                      physics: const NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: datalength,
                      itemBuilder: (context, i) =>
                      ItemCard(
                          theId: data[i].theId,
                          theName: data[i].theName,
                          theExpirationDate: data[i].theExpirationDate,
                          theManufacturedDate: data[i].theManufacturedDate,
                          theBestBefore: data[i].theBestBefore,
                          // thePurchasedDate: data[i].thePurchasedDate,
                          addFunction: addFunction,
                          deleteFunction: deleteFunction,
                        ),




                  );
                // );
              // );

            },

          ),
        ],
      ),

    );

  }
}

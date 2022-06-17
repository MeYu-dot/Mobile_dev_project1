class Item{
  Item({
    this.theId,
    required this.theName,
    // this.thePurchasedDate,
    this.theBestBefore,
    this.theExpirationDate,
    required this.theManufacturedDate});
  final int? theId;
  final String theName;
  // final DateTime? thePurchasedDate;
  final DateTime? theExpirationDate;
  final DateTime theManufacturedDate;
  final DateTime? theBestBefore;


  Map<String, dynamic> toMap() {
    return ({
      'theId': theId,
      'theName': theName,
      // 'thePurchasedDate': thePurchasedDate.toString(),
      'theExpirationDate': theExpirationDate.toString(),
      'theManufacturedDate': theManufacturedDate.toString(),
      'theBestBefore': theBestBefore.toString()
    }
    );
  }
  @override
  String toString() {
    return 'Item(theId : $theId, theName: $theName, '
        // 'thePurchasedDate: $thePurchasedDate, '
        'theExpirationDate: $theExpirationDate,'
        'theManufacturedDate: $theManufacturedDate,'
        'theBestBefore: $theBestBefore';
  }
}

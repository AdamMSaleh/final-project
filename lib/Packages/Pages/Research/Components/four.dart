class Four {
  int? id;
  int? flightName;

  Four({this.flightName, this.id});
}

class Passenger {
  int? id;
  int? checkedBags;

  Passenger({this.id, this.checkedBags});

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(id: json['id'], checkedBags: json['checked_bags ']);
  }
}

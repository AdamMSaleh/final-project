class Detiels_Invoices {
  String name_item;
  double price;
  int count_item;
  late double total;
  Detiels_Invoices(this.name_item, this.price, this.count_item) {
    total = price * count_item;
  }
}

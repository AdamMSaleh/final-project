// ignore_for_file: non_constant_identifier_names, camel_case_types

class Detiels_Invoices {
  String name_item;
  double price;
  int count_item;
  late double total;
  Detiels_Invoices(this.name_item, this.price, this.count_item) {
    total = price * count_item;
  }
}

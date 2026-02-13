import 'package:tirando_factos/data/model/customer_model.dart';
import 'package:tirando_factos/data/model/item_model.dart';

class Order {
  final int? id;
  final String document;
  final int numbering_range_id;
  final String reference_code;
  final String description;
  final String payment_method_code;
  final CustomerModel customer;
  final List<ItemModel> items;

  Order({
    this.id,
    required this.document,
    required this.numbering_range_id,
    required this.reference_code,
    required this.description,
    required this.payment_method_code,
    required this.customer,
    required this.items
  });


}
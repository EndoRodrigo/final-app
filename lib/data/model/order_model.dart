import '../../domain/models/order.dart';

class OrderModel extends Order {
  OrderModel({
    required super.id,
    required super.document,
    required super.numbering_range_id,
    required super.reference_code,
    required super.description,
    required super.payment_method_code,
    required super.customer,
    required super.items
  });

  Map<String, dynamic> toMap(){
    return {
      "document": document,
      "numbering_range_id": numbering_range_id,
      "reference_code": reference_code,
      "description": description,
      "payment_method_code": payment_method_code,
      "customer": customer,
      "items": items
    };
  }

  factory OrderModel.fromMap(int id,Map<String, dynamic> map){
    return OrderModel(
        id: id,
        document: map["document"],
        numbering_range_id: map["numbering_range_id"],
        reference_code: map["reference_code"],
        description: map["description"],
        payment_method_code: map["payment_method_code"],
        customer: map["customer"],
        items: map["items"]
    );
  }


}
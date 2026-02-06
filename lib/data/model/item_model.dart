import 'package:tirando_factos/domain/models/items.dart';
import 'package:tirando_factos/domain/models/withholding_taxes.dart';

class ItemModel extends Items {
  ItemModel({
    required super.id,
    required super.code_reference,
    required super.name,
    required super.quantity,
    required super.discount_rate,
    required super.price,
    required super.tax_rate,
    required super.unit_measure_id,
    required super.standard_code_id,
    required super.is_excluded,
    required super.tribute_id,
    super.withholding_taxes = const [],
  });

  /// Convierte el objeto a Map (para enviar a API)
  Map<String, dynamic> toMap() {
    return {
      'code_reference': code_reference,
      'name': name,
      'quantity': quantity,
      'discount_rate': discount_rate,
      'price': price,
      'tax_rate': tax_rate,
      'unit_measure_id': unit_measure_id,
      'standard_code_id': standard_code_id,
      'is_excluded': is_excluded,
      'tribute_id': tribute_id,
      'withholding_taxes':
      withholding_taxes.map((tax) => tax.toMap()).toList(),
    };
  }

  /// Crea el objeto desde un Map (respuesta de API)
  factory ItemModel.fromMap(String id,Map<String, dynamic> map) {
    return ItemModel(
      id: id,
      code_reference: map['code_reference'] ?? '',
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? 0,
      discount_rate: (map['discount_rate'] as num?)?.toDouble() ?? 0.0,
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      tax_rate: map['tax_rate'] ?? '',
      unit_measure_id: map['unit_measure_id'] ?? 0,
      standard_code_id: map['standard_code_id'] ?? 0,
      is_excluded: map['is_excluded'] ?? 0,
      tribute_id: map['tribute_id'] ?? 0,
      withholding_taxes: map['withholding_taxes'] != null ? List<Withholding_taxes>.from(map['withholding_taxes'].map((tax) => Withholding_taxes.fromMap(tax)),) : [],
    );
  }
}

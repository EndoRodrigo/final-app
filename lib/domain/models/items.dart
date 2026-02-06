import 'package:tirando_factos/domain/models/withholding_taxes.dart';

class Items {
  final String code_reference;
  final String name;
  final int quantity;
  final double discount_rate;
  final double price;
  final String tax_rate;
  final int unit_measure_id;
  final int standard_code_id;
  final int is_excluded;
  final int tribute_id;
  final List<Withholding_taxes> withholding_taxes;

  Items({
    required this.code_reference,
    required this.name,
    required this.quantity,
    required this.discount_rate,
    required this.price,
    required this.tax_rate,
    required this.unit_measure_id,
    required this.standard_code_id,
    required this.is_excluded,
    required this.tribute_id,
    this.withholding_taxes = const [],
  });
}







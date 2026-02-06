class Withholding_taxes {
  final String code;
  final double withholding_tax_rate;

  Withholding_taxes(this.code, this.withholding_tax_rate);

  /// Convierte el objeto a Map (para API / JSON)
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'withholding_tax_rate': withholding_tax_rate,
    };
  }

  /// Crea el objeto desde un Map (respuesta de API)
  factory Withholding_taxes.fromMap(Map<String, dynamic> map) {
    return Withholding_taxes(
      map['code'] ?? '',
      (map['withholding_tax_rate'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

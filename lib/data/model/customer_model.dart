import 'package:tirando_factos/domain/models/customer.dart';

class CustomerModel extends Customer{

  CustomerModel({
    required super.id,
    required super.identification,
    required super.dv,
    required super.company,
    required super.tradeName,
    required super.names,
    required super.address,
    required super.email,
    required super.phone,
    required super.legalOrganizationId,
    required super.tributeId,
    required super.identificationDocumentId,
    required super.municipalityId,
  });

  Map<String, dynamic> toMap() {
    return {
      "identification": identification,
      "dv": dv,
      "company": company,
      "trade_name": tradeName,
      "names": names,
      "address": address,
      "email": email,
      "phone": phone,
      "legal_organization_id": legalOrganizationId,
      "tribute_id": tributeId,
      "identification_document_id": identificationDocumentId,
      "municipality_id": municipalityId,
    };
  }

  factory CustomerModel.fromMap(String id, Map<String, dynamic> map) {
    return CustomerModel(
      id: id,
      identification: map["identification"],
      dv: map["dv"],
      company: map["company"] ?? "",
      tradeName: map["trade_name"] ?? "",
      names: map["names"],
      address: map["address"],
      email: map["email"],
      phone: map["phone"],
      legalOrganizationId: map["legal_organization_id"],
      tributeId: map["tribute_id"],
      identificationDocumentId: map["identification_document_id"],
      municipalityId: map["municipality_id"],
    );
  }


}
class Customer {
  String? id; // Firestore ID
  String identification;
  String dv;
  String company;
  String tradeName;
  String names;
  String address;
  String email;
  String phone;
  String legalOrganizationId;
  String tributeId;
  int identificationDocumentId;
  String municipalityId;

  Customer({
    this.id,
    required this.identification,
    required this.dv,
    required this.company,
    required this.tradeName,
    required this.names,
    required this.address,
    required this.email,
    required this.phone,
    required this.legalOrganizationId,
    required this.tributeId,
    required this.identificationDocumentId,
    required this.municipalityId,
  });

}

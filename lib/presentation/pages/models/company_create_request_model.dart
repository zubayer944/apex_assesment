class CompanyCreateRequestModel {
  final String companyName;
  final String email;
  final String password;
  final String phone;

  CompanyCreateRequestModel(
      {required this.companyName,
      required this.email,
      required this.password,
      required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_name'] = companyName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}

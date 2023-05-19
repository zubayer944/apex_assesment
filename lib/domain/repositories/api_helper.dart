import 'package:appex_assesment/data/models/companies.dart';
import 'package:appex_assesment/presentation/pages/models/company_create_request_model.dart';
import 'package:get/get.dart';

abstract class ApiHelper {
  Future<Companies> getCompaniesList({
    int? page,
    int? perPageItem,
  });

  Future<Response> createCompany(
      {required CompanyCreateRequestModel companyCreateRequestModel});
}

import 'dart:async';
import 'dart:convert';
import 'package:appex_assesment/presentation/pages/models/company_create_request_model.dart';
import 'package:get/get_connect.dart';

import '../../data/models/companies.dart';
import '../utilities/log_print.dart';
import 'api_helper.dart';

part 'api_urls.dart';

class ApiHelperImpl extends GetConnect with ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = _ApiUrls.base;
    httpClient.timeout = const Duration(seconds: 120);
  }

  static convert<T>(
    Map<String, dynamic> response,
    Function(Map<String, dynamic>) base,
  ) {
    try {
      return base(response) as T;
    } catch (e, s) {
      LogPrint.print(e.toString());
      print(s);
    }
  }

  @override
  Future<Companies> getCompaniesList({int? page, int? perPageItem}) async {
    String url = "company";
    var response = await get(url);
    return convert<Companies>(response.body, Companies.fromJson);
  }

  @override
  Future<Response> createCompany({required CompanyCreateRequestModel companyCreateRequestModel}) async {
    String url = "company";
    var response = await post(url, jsonEncode(companyCreateRequestModel.toJson()));
    return response;
  }
}

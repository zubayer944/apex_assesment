import 'package:appex_assesment/domain/utilities/log_print.dart';
import 'package:appex_assesment/presentation/pages/interface/home_interface.dart';
import 'package:appex_assesment/presentation/pages/models/company_create_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/companies.dart';
import '../../../domain/repositories/api_helper.dart';

class HomeController extends GetxController implements HomeInterface {
  final formKey = GlobalKey<FormState>();

  final ApiHelper _apiHelper = Get.find();

  Rx<Companies> companyList = Companies().obs;

  Rx<TextEditingController> tecEmail = TextEditingController().obs;
  Rx<TextEditingController> tecPhone = TextEditingController().obs;
  Rx<TextEditingController> tecPassword = TextEditingController().obs;
  Rx<TextEditingController> tecCompanyName = TextEditingController().obs;

  @override
  void onInit() {
    _fetchCompanyList();
    super.onInit();
  }

  void _fetchCompanyList() {
    _apiHelper.getCompaniesList().then((Companies value) {
      if (value.statusCode == "1") {
        companyList.value = value;

      } else {
        LogPrint.print("Something went wrong");
      }
    });
  }

  @override
  void onCreateCompanyPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      CompanyCreateRequestModel companyCreateRequestModel =
          CompanyCreateRequestModel(
              companyName: tecCompanyName.value.text.trim(),
              email: tecEmail.value.text.trim(),
              password: tecPassword.value.text.trim(),
              phone: tecPhone.value.text.trim());

      _apiHelper
          .createCompany(companyCreateRequestModel: companyCreateRequestModel)
          .then((Response value) {
        try {
          if (value.statusCode == 201 || value.statusCode == 200) {
            Get.back();
            _fetchCompanyList();
            _clearText();
            Get.snackbar(
              'Success', // Snackbar title
              'Company created successfully',
              backgroundColor: Colors.green, // Snackbar message
              snackPosition: SnackPosition.TOP,
              duration: const Duration(
                  seconds:
                      1), // Set the duration for which the snackbar will be displayed
            );
          } else {
            Get.snackbar(
              'Warning', // Snackbar title
              'Company creation failed',
              backgroundColor: Colors.red, // Snackbar message
              snackPosition: SnackPosition.TOP,
              duration: const Duration(
                  seconds:
                      1), // Set the duration for which the snackbar will be displayed
            );
          }
        } catch (e, s) {

          LogPrint.print('HomeController.onCreateCompanyPressed --->$e');
          LogPrint.print('HomeController.onCreateCompanyPressed --->$s');

        }
      });
    }
  }

  void _clearText() {
    tecCompanyName.value.clear();
    tecEmail.value.clear();
    tecPassword.value.clear();
    tecPhone.value.clear();
  }
}

import 'package:appex_assesment/data/models/companies.dart';
import 'package:appex_assesment/domain/utilities/app_color.dart';
import 'package:appex_assesment/domain/utilities/validators.dart';
import 'package:appex_assesment/presentation/pages/create_company.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/utilities/app_string.dart';
import '../widgets/common_widgets/Custom_buttons.dart';
import 'controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:FloatingActionButton.extended(
        backgroundColor: AppColors.color25A5A3,
        onPressed: (){
          _showDialog(context);
        },
        label: const Text('Create company'),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text("Companies List",style: TextStyle(color: AppColors.blackColor),),
      centerTitle: true,
      ),
      body: Obx(() => ((controller.companyList.value.companyList)?.data ?? []).isEmpty
          ? const Center(child: CupertinoActivityIndicator())
          : _comapnyListBuildBody(),)
    );
  }

  Widget _comapnyListBuildBody() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: (controller.companyList.value.companyList?.data ?? []).length,
        itemBuilder: (context,index){
          return _companyListView(
              (controller.companyList.value.companyList?.data ?? [])[index]
          );
        });
  }

  Widget _companyListView(Data data){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.companyName ?? "",style: const TextStyle(fontSize: 18),),
          Text(data.email ?? "",style: const TextStyle(fontSize: 14,color: Colors.grey),),
          const SizedBox(height: 3,),
          Text(data.phone ?? "",style: const TextStyle(fontSize: 14,color: Colors.grey),),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Obx(() => AlertDialog(
          title: const Text("Create New Company"),
          // content: new Text("Alert Dialog body"),
          content: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  CustomTextFromField(
                    controller: controller.tecCompanyName.value,
                    hintTile: "Company Name",
                    validator: (value)=> Validators.emptyValidator(value, AppStrings.allStrings.companyNameIsRequired),
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFromField(
                    controller: controller.tecEmail.value,

                    hintTile: "Email",
                    validator:(value)=> Validators.emailValidator(value),
                  ),
                  const SizedBox(height: 10,),

                  CustomTextFromField(
                    controller: controller.tecPhone.value,
                    hintTile: "Phone",
                    validator: (value) => Validators.emptyValidator(
                      value,
                      AppStrings.allStrings.phoneIsRequired,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFromField(
                    controller: controller.tecPassword.value,
                    hintTile: "Password",
                    validator: (value) => Validators.passwordValidator(value),

                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtons.regular(
                    horizontalMargin: 10,
                    text: "Create a new company",
                    onPressed: controller.onCreateCompanyPressed,
                  )
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}

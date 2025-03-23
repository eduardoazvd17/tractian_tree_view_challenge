import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class HomePage extends GetWidget<HomeController> {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(CustomAssets.logoImage, width: 126)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: ListErrorWidget(
              errorMessage: controller.errorMessage.value,
              onTryAgain: controller.getCompanies,
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.companies.length,
          itemBuilder: (context, index) {
            final CompanyEntity company = controller.companies[index];
            return CompanyWidget(company: company, onTap: () {});
          },
        );
      }),
    );
  }
}

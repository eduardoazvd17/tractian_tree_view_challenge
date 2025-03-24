import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/core.dart';
import '../../../assets.dart';

class TreeWidget extends GetWidget<AssetsController> {
  const TreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.value.isNotEmpty) {
        return Center(
          child: ListErrorWidget(
            errorMessage: controller.errorMessage.value,
            onTryAgain: controller.loadLocationsAndAssets,
          ),
        );
      }

      return ListView.builder(
        itemCount: controller.itemsWithoutParent.length,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemBuilder: (context, index) {
          final TreeItemEntity item = controller.itemsWithoutParent[index];
          return TreeItemWidget(
            treeItem: item,
            parentChildrenLength: controller.itemsWithoutParent.length,
          );
        },
      );
    });
  }
}

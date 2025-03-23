import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets.dart';

class AssetsPage extends StatefulWidget {
  static const String routeName = '/assets';
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  late final AssetsController controller;
  late final TextEditingController searchController;

  @override
  void initState() {
    controller = Get.find<AssetsController>();
    searchController = TextEditingController(text: controller.searchText.value);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Assets  |  ${controller.arguments.companyName}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 8,
              children: [
                TextFormField(
                  controller: searchController,
                  onChanged: controller.onSearchTextChanged,
                  decoration: InputDecoration(
                    hintText: 'Buscar Ativo ou Local',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                Obx(
                  () => Row(
                    spacing: 8,
                    children: [
                      SelectableButtonWidget(
                        icon: Icons.bolt,
                        title: 'Sensor de Energia',
                        isSelected: controller.isEnergySensorSelected.value,
                        onTap: controller.toggleEnergySensorSelected,
                      ),
                      SelectableButtonWidget(
                        icon: Icons.info_outline,
                        title: 'Crítico',
                        isSelected: controller.isCriticalSelected.value,
                        onTap: controller.toggleCriticalSelected,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 0, color: Theme.of(context).dividerColor),
          const SizedBox(height: 5),
          Expanded(child: AssetsTreeWidget()),
        ],
      ),
    );
  }
}

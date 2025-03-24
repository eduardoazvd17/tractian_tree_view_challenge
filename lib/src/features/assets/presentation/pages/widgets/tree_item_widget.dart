import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/core.dart';
import '../../../assets.dart';

class TreeItemWidget extends StatefulWidget {
  final TreeItemEntity treeItem;
  final int parentChildrenLength;
  const TreeItemWidget({
    super.key,
    required this.treeItem,
    required this.parentChildrenLength,
  });

  @override
  State<TreeItemWidget> createState() => _TreeItemWidgetState();
}

class _TreeItemWidgetState extends State<TreeItemWidget> {
  late final AssetsController _controller;

  @override
  void initState() {
    _controller = Get.find<AssetsController>();
    super.initState();
  }

  bool get _isExpanded => _controller.isItemExpanded(widget.treeItem.id);

  List<TreeItemEntity> get _children =>
      _controller.getChildrenItems(widget.treeItem);

  @override
  Widget build(BuildContext context) {
    final String assetIcon = switch (widget.treeItem) {
      AssetEntity(:final sensorId) =>
        sensorId == null ? CustomAssets.assetIcon : CustomAssets.componentIcon,
      LocationEntity() => CustomAssets.locationIcon,
      _ => throw Exception('Invalid item type'),
    };

    final Icon? sensorIcon =
        widget.treeItem is AssetEntity
            ? (widget.treeItem as AssetEntity).isOperatingStatus
                ? Icon(Icons.bolt, color: Colors.green, size: 20)
                : (widget.treeItem as AssetEntity).isAlertStatus
                ? Icon(Icons.circle, color: Colors.red, size: 12)
                : null
            : null;

    return Obx(
      () => AnimatedSize(
        curve: Curves.ease,
        alignment: Alignment.topCenter,
        duration: const Duration(milliseconds: 200),
        child: Column(
          children: [
            InkWell(
              onTap: () => _controller.toggleIsItemExpanded(widget.treeItem.id),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  spacing: 5,
                  children: [
                    Container(
                      margin:
                          widget.parentChildrenLength == 1 && _children.isEmpty
                              ? const EdgeInsets.only(left: 15)
                              : null,
                      decoration:
                          widget.parentChildrenLength == 1 && _children.isEmpty
                              ? BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Theme.of(context).dividerColor,
                                    width: 2,
                                  ),
                                  bottom: BorderSide(
                                    color: Theme.of(context).dividerColor,
                                    width: 2,
                                  ),
                                ),
                              )
                              : null,
                      child: Visibility(
                        visible: _children.isNotEmpty,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: AnimatedRotation(
                          turns: _isExpanded ? 0.25 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    ),
                    Image.asset(assetIcon, height: 24),
                    Flexible(child: Text(widget.treeItem.name)),
                    if (sensorIcon != null) sensorIcon,
                  ],
                ),
              ),
            ),
            if (_isExpanded && _children.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(left: 11),
                padding: const EdgeInsets.only(left: 11, bottom: 15),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 2,
                    ),
                  ),
                ),
                child: Column(
                  children:
                      _children.map((child) {
                        return TreeItemWidget(
                          treeItem: child,
                          parentChildrenLength: _children.length,
                        );
                      }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

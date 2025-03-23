import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../assets.dart';

class TreeItemWidget extends StatefulWidget {
  final TreeItemEntity treeItem;
  final List<TreeItemEntity> Function(TreeItemEntity) getChildrenItems;
  final int parentChildrenLength;
  const TreeItemWidget({
    super.key,
    required this.treeItem,
    required this.getChildrenItems,
    required this.parentChildrenLength,
  });

  @override
  State<TreeItemWidget> createState() => _TreeItemWidgetState();
}

class _TreeItemWidgetState extends State<TreeItemWidget> {
  late final List<TreeItemEntity> _children;
  bool _isExpanded = false;

  @override
  void initState() {
    _children = widget.getChildrenItems(widget.treeItem);
    super.initState();
  }

  void toggleIsExpanded() => setState(() => _isExpanded = !_isExpanded);

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
            ? (widget.treeItem as AssetEntity).isEnergySensor
                ? Icon(Icons.bolt, color: Colors.green, size: 20)
                : (widget.treeItem as AssetEntity).isVibrationSensor
                ? Icon(Icons.circle, color: Colors.red, size: 12)
                : null
            : null;

    return AnimatedSize(
      curve: Curves.ease,
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: [
          InkWell(
            onTap: toggleIsExpanded,
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
                        getChildrenItems: widget.getChildrenItems,
                        parentChildrenLength: _children.length,
                      );
                    }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

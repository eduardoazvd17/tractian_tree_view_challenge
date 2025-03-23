import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../assets.dart';

class AssetTreeItemWidget extends StatefulWidget {
  final TreeItemEntity item;
  final List<TreeItemEntity> Function(TreeItemEntity) getChildrenItems;
  final int parentChildrenLength;
  const AssetTreeItemWidget({
    super.key,
    required this.item,
    required this.getChildrenItems,
    required this.parentChildrenLength,
  });

  @override
  State<AssetTreeItemWidget> createState() => _AssetTreeItemWidgetState();
}

class _AssetTreeItemWidgetState extends State<AssetTreeItemWidget> {
  late final List<TreeItemEntity> _children;
  bool _isExpanded = false;

  @override
  void initState() {
    _children = widget.getChildrenItems(widget.item);
    super.initState();
  }

  void toggleIsExpanded() => setState(() => _isExpanded = !_isExpanded);

  @override
  Widget build(BuildContext context) {
    final String assetIcon = switch (widget.item) {
      AssetEntity(:final sensorId) =>
        sensorId == null ? CustomAssets.assetIcon : CustomAssets.componentIcon,
      LocationEntity() => CustomAssets.locationIcon,
      _ => throw Exception('Invalid item type'),
    };

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
                  Flexible(child: Text(widget.item.name)),
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
                      return AssetTreeItemWidget(
                        item: child,
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

import '../../assets.dart';

class AssetEntity extends TreeItemEntity {
  final String? locationId;
  final String? sensorId;
  final String? sensorType;
  final String? status;

  bool get isOperatingStatus => status == 'operating';
  bool get isAlertStatus => status == 'alert';

  const AssetEntity({
    required super.id,
    required super.name,
    required super.parentId,
    required this.locationId,
    required this.sensorId,
    required this.sensorType,
    required this.status,
  });
}

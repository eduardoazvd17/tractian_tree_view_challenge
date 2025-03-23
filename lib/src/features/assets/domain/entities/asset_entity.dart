import '../../assets.dart';

class AssetEntity extends TreeItemEntity {
  final String? locationId;
  final String? sensorId;
  final String? sensorType;
  final String? status;

  bool get isOperating => status == 'operating';
  bool get isEnergySensor => sensorType == 'energy';
  bool get isVibrationSensor => sensorType == 'vibration';

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

import '../../assets.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    required super.id,
    required super.name,
    required super.parentId,
    required super.locationId,
    required super.sensorId,
    required super.sensorType,
    required super.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parentId': parentId,
      'locationId': locationId,
      'sensorId': sensorId,
      'sensorType': sensorType,
      'status': status,
    };
  }

  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      id: map['id'] as String,
      name: map['name'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      locationId:
          map['locationId'] != null ? map['locationId'] as String : null,
      sensorId: map['sensorId'] != null ? map['sensorId'] as String : null,
      sensorType:
          map['sensorType'] != null ? map['sensorType'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }
}

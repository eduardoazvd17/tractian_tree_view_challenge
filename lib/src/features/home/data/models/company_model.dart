import '../../home.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({required super.id, required super.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(id: map['id'] as String, name: map['name'] as String);
  }
}

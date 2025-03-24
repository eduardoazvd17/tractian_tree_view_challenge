import 'package:equatable/equatable.dart';

abstract class TreeItemEntity extends Equatable {
  final String id;
  final String name;
  final String? parentId;
  const TreeItemEntity({required this.id, required this.name, this.parentId});

  @override
  List<Object?> get props => [id, name, parentId];
}

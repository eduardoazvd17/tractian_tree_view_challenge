abstract class TreeItemEntity {
  final String id;
  final String name;
  final String? parentId;
  const TreeItemEntity({required this.id, required this.name, this.parentId});
}

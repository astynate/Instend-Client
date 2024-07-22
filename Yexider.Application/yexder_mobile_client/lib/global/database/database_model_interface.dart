interface class IDatabaseModel {
  String? id;
  IDatabaseModel.empthy();
  IDatabaseModel.fromMap(Map<String, dynamic> map);
  Map<String, dynamic> toJson() => <String, dynamic>{};
  String createTable() => "";
  late String tableName;
}
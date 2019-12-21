class GroupMessageModel {
  final String id;
  final String group_id;
  final String account_id;
  final String content;
  final String created;
  final String modified;

  GroupMessageModel.fromJson(json)
    : id = json['id'],
      group_id = json['group_id'],
      account_id = json['account_id'],
      content = json['content'],
      created = json['created'],
      modified = json['modified'];
}
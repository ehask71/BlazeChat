import 'package:blaze_chat/models/account.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

List<GroupMessage> allGroupMessagesFromJson(String str){
  final jsonData = json.decode(str);
  return new List<GroupMessage>.from(jsonData.map((x) => GroupMessage.fromJson(x)));
}

class GroupMessage extends Equatable {
  final int id;
  final String group_id;
  final String account_id;
  final String content;
  final String created;
  final String modified;
  final Account account;

  GroupMessage(
      {this.id, this.group_id, this.account_id, this.content, this.created, this.modified,this.account});

  factory GroupMessage.fromJson(Map<String, dynamic> json) =>
      GroupMessage(
          id: json['id'],
          group_id: json['group_id'],
          account_id: json['account_id'],
          content: json['content'],
          created: json['created'],
          modified: json['modified'],
          account: Account.fromJson(json["account"])
      );

  @override
  List<Object> get props =>
      [id, group_id, account_id, content, created, modified];

}



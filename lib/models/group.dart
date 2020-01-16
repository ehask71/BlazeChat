import 'package:blaze_chat/services/webservice.dart';
import 'package:equatable/equatable.dart';
import 'package:blaze_chat/models/group_entity.dart';
import 'dart:convert';

List<Group> allGroupsFromJson(String str){
  final jsonData = json.decode(str);
  return new List<Group>.from(jsonData.map((x) => Group.fromJson(x)));
}

class Group extends Equatable {
  final int id;
  final String title;
  final String image;
  final int status;
  final String created;

  Group({this.id, this.title, this.image, this.status, this.created});

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        status: json['status'],
        created: json['created']);

  @override
  List<Object> get props => [id, title, image, status, created];

  GroupEntity toEntity() {
    return GroupEntity(id, title, image, status, created);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'status': status,
        'created': created,
      };
}

class GroupList {
  final List<Group> groups;

  GroupList({this.groups});
  factory GroupList.fromJson(List<dynamic> parsedJson) {

    List<Group> groups = new List<Group>();
    groups = parsedJson.map((i)=>Group.fromJson(i)).toList();

    return new GroupList(
        groups: groups
    );
  }
}

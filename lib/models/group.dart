import 'package:equatable/equatable.dart';
import 'package:blaze_chat/models/group_entity.dart';

class Group extends Equatable {
  final int id;
  final String title;
  final String image;
  final bool status;
  final String created;

  Group({this.id, this.title, this.image, this.status, this.created});

  Group.fromJson(json)
      : id = json['id'],
        title = json['title'],
        image = json['image'],
        status = json['status'],
        created = json['created'];

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

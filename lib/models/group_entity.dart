
class GroupEntity {
  final int id;
  final String title;
  final String image;
  final bool status;
  final String created;

  GroupEntity(this.id,this.title,this.image,this.status,this.created);

  @override
  int get hashCode =>
      created.hashCode ^ status.hashCode ^ image.hashCode ^ title.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GroupEntity &&
              runtimeType == other.runtimeType &&
              created == other.created &&
              status == other.status &&
              image == other.image &&
              title == other.title &&
              id == other.id;

  Map<String, Object> toJson(){
    return {
      "id": id,
      "title": title,
      "image": image,
      "status": status,
      "created": created
    };
  }

  @override
  String toString() {
    return 'GroupEntity{id: $id, title: $title, image: $image, status: $status, created: $created}';
  }

  static GroupEntity fromJson(Map<String, Object> json){
    return GroupEntity(
      json["id"] as int,
      json["title"] as String,
      json["image"] as String,
      json["status"] as bool,
      json["created"] as String,
    );
  }
}
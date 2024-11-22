// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tool {
  int id;
  int groupId;
  String name;
  String description;
  String url;
  String icon;

  Tool({
    required this.id,
    required this.groupId,
    required this.name,
    required this.description,
    required this.url,
    required this.icon,
  });

  Tool copyWith({
    int? id,
    int? groupId,
    String? name,
    String? description,
    String? url,
    String? icon,
  }) {
    return Tool(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      description: description ?? this.description,
      url: url ?? this.url,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'groupId': groupId,
      'name': name,
      'description': description,
      'url': url,
      'icon': icon,
    };
  }

  factory Tool.fromMap(Map<String, dynamic> map) {
    return Tool(
      id: map['id'] as int,
      groupId: map['groupId'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tool.fromJson(String source) =>
      Tool.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tool(id: $id, groupId: $groupId, name: $name, description: $description, url: $url, icon: $icon)';
  }

  @override
  bool operator ==(covariant Tool other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.groupId == groupId &&
        other.name == name &&
        other.description == description &&
        other.url == url &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        groupId.hashCode ^
        name.hashCode ^
        description.hashCode ^
        url.hashCode ^
        icon.hashCode;
  }
}

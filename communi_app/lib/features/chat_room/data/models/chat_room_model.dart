import 'dart:convert';
import 'package:communi_app/core/common/entities/chat_room.dart';

class ChatRoomModel extends ChatRoom {
  ChatRoomModel({
    required super.id,
    required super.userId,
    required super.name,
    super.creatorName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'name': name,
    };
  }

  factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRoomModel.fromJson(String source) =>
      ChatRoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ChatRoomModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? creatorName,
  }) {
    return ChatRoomModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      creatorName: creatorName ?? this.creatorName,
    );
  }
}

import 'dart:convert';

import 'package:communi_app/features/chat/domain/entity/message.dart';

class MessageModel extends Message {
  MessageModel({
    required super.id,
    required super.userId,
    required super.chatRoomId,
    required super.message,
    super.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'chat_room_id': chatRoomId,
      'message': message,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      chatRoomId: map['chat_room_id'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MessageModel copyWith({
    String? id,
    String? userId,
    String? chatRoomId,
    String? message,
    String? username,
  }) {
    return MessageModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      message: message ?? this.message,
      username: username ?? this.username,
    );
  }
}

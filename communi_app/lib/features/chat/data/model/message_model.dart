import 'dart:convert';

import 'package:communi_app/features/chat/domain/entity/message.dart';

class MessageModel extends Message {
  MessageModel({
    required super.id,
    required super.userId,
    required super.chatRoomId,
    required super.message,
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
}

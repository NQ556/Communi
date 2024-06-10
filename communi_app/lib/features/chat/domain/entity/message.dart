// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String id;
  final String userId;
  final String chatRoomId;
  final String message;
  final String? username;

  Message({
    required this.id,
    required this.userId,
    required this.chatRoomId,
    required this.message,
    required this.username,
  });
}

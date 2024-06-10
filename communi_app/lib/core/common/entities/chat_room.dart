// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatRoom {
  final String id;
  final String userId;
  final String name;
  final String? creatorName;

  ChatRoom({
    required this.id,
    required this.userId,
    required this.name,
    required this.creatorName,
  });
}

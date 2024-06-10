part of 'chat_room_bloc.dart';

@immutable
sealed class ChatRoomEvent {}

final class ChatRoomAdd extends ChatRoomEvent {
  final String userId;
  final String name;

  ChatRoomAdd({
    required this.userId,
    required this.name,
  });
}

final class FetchAllChatRooms extends ChatRoomEvent {}

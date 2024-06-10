part of 'message_bloc.dart';

@immutable
sealed class MessageEvent {}

final class MessageAdd extends MessageEvent {
  final String userId;
  final String chatRoomId;
  final String message;

  MessageAdd({
    required this.userId,
    required this.chatRoomId,
    required this.message,
  });
}

final class FetchAllMessages extends MessageEvent {
  final String chatRoomId;

  FetchAllMessages({
    required this.chatRoomId,
  });
}

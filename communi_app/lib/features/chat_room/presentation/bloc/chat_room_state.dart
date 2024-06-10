part of 'chat_room_bloc.dart';

@immutable
sealed class ChatRoomState {}

final class ChatRoomInitial extends ChatRoomState {}

final class ChatRoomLoading extends ChatRoomState {}

final class ChatRoomFailure extends ChatRoomState {
  final String error;
  ChatRoomFailure(this.error);
}

final class ChatRoomSuccess extends ChatRoomState {}

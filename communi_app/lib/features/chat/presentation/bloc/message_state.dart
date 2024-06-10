part of 'message_bloc.dart';

@immutable
sealed class MessageState {}

final class MessageInitial extends MessageState {}

final class MessageFailure extends MessageState {
  final String error;
  MessageFailure(this.error);
}

final class MessageSuccess extends MessageState {}

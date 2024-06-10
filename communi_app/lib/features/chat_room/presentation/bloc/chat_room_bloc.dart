import 'package:communi_app/features/chat_room/domain/usecase/add_chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'chat_room_event.dart';
part 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final AddChatRoom addChatRoom;

  ChatRoomBloc(this.addChatRoom) : super(ChatRoomInitial()) {
    on<ChatRoomEvent>((event, emit) => emit(ChatRoomLoading()));
    on<ChatRoomAdd>(_onChatRoomAdd);
  }

  void _onChatRoomAdd(
    ChatRoomAdd event,
    Emitter<ChatRoomState> emit,
  ) async {
    final response = await addChatRoom(
      ChatRoomParams(
        userId: event.userId,
        name: event.name,
      ),
    );

    response.fold(
      (onLeft) => emit(ChatRoomFailure(onLeft.message)),
      (onRight) => emit(
        ChatRoomSuccess(),
      ),
    );
  }
}

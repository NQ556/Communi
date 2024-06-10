import 'package:communi_app/core/usecase/usecase.dart';
import 'package:communi_app/features/chat_room/domain/entities/chat_room.dart';
import 'package:communi_app/features/chat_room/domain/usecase/add_chat_room.dart';
import 'package:communi_app/features/chat_room/domain/usecase/get_all_chat_rooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'chat_room_event.dart';
part 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final AddChatRoom _addChatRoom;
  final GetAllChatRooms _getAllChatRooms;

  ChatRoomBloc({
    required AddChatRoom addChatRoom,
    required GetAllChatRooms getAllChatRooms,
  })  : _addChatRoom = addChatRoom,
        _getAllChatRooms = getAllChatRooms,
        super(ChatRoomInitial()) {
    on<ChatRoomEvent>((event, emit) => emit(ChatRoomLoading()));
    on<ChatRoomAdd>(_onChatRoomAdd);
    on<FetchAllChatRooms>(_onGetAllChatRooms);
  }

  void _onChatRoomAdd(
    ChatRoomAdd event,
    Emitter<ChatRoomState> emit,
  ) async {
    final response = await _addChatRoom(
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

  void _onGetAllChatRooms(
    FetchAllChatRooms event,
    Emitter<ChatRoomState> emit,
  ) async {
    final response = await _getAllChatRooms(NoParams());

    response.fold(
      (onLeft) => emit(ChatRoomFailure(onLeft.message)),
      (onRight) => emit(ChatRoomDisplaySuccess(onRight)),
    );
  }
}

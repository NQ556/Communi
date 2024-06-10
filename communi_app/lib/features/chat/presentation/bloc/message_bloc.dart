import 'package:bloc/bloc.dart';
import 'package:communi_app/features/chat/domain/entity/message.dart';
import 'package:communi_app/features/chat/domain/usecase/get_all_messages.dart';
import 'package:communi_app/features/chat/domain/usecase/send_message.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final SendMessage _sendMessage;
  final GetAllMessages _getAllMessages;

  MessageBloc({
    required SendMessage sendMessage,
    required GetAllMessages getAllMessages,
  })  : _sendMessage = sendMessage,
        _getAllMessages = getAllMessages,
        super(MessageInitial()) {
    on<MessageAdd>(_onMessageAdd);
    on<FetchAllMessages>(_onGetAllMessages);
  }

  void _onMessageAdd(
    MessageAdd event,
    Emitter<MessageState> emit,
  ) async {
    final response = await _sendMessage(
      MessageParams(
        userId: event.userId,
        chatRoomId: event.chatRoomId,
        message: event.message,
      ),
    );

    response.fold(
      (onLeft) => emit(MessageFailure(onLeft.message)),
      (onRight) => emit(
        MessageSuccess(),
      ),
    );
  }

  void _onGetAllMessages(
    FetchAllMessages event,
    Emitter<MessageState> emit,
  ) async {
    final response =
        await _getAllMessages(ChatParams(chatRoomId: event.chatRoomId));

    response.fold(
      (onLeft) => emit(MessageFailure(onLeft.message)),
      (onRight) => emit(MessageDisplaySuccess(onRight)),
    );
  }
}

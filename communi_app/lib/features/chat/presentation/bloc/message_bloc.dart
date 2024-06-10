import 'package:bloc/bloc.dart';
import 'package:communi_app/features/chat/domain/usecase/send_message.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final SendMessage _sendMessage;

  MessageBloc({
    required SendMessage sendMessage,
  })  : _sendMessage = sendMessage,
        super(MessageInitial()) {
    on<MessageAdd>(_onMessageAdd);
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
}

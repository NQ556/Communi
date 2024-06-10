import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/core/usecase/usecase.dart';
import 'package:communi_app/features/chat/domain/entity/message.dart';
import 'package:communi_app/features/chat/domain/repository/message_repository.dart';
import 'package:fpdart/fpdart.dart';

class SendMessage implements Usecase<Message, MessageParams> {
  final MessageRepository messageRepository;
  SendMessage(this.messageRepository);

  @override
  Future<Either<Failure, Message>> call(MessageParams params) async {
    return await messageRepository.sendMessage(
        userId: params.userId,
        chatRoomId: params.chatRoomId,
        message: params.message);
  }
}

class MessageParams {
  final String userId;
  final String chatRoomId;
  final String message;

  MessageParams({
    required this.userId,
    required this.chatRoomId,
    required this.message,
  });
}

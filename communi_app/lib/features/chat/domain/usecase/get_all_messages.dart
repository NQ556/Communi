import 'package:communi_app/core/usecase/usecase.dart';
import 'package:communi_app/features/chat/domain/entity/message.dart';
import 'package:communi_app/features/chat/domain/repository/message_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

class GetAllMessages implements Usecase<List<Message>, ChatParams> {
  final MessageRepository messageRepository;
  GetAllMessages(this.messageRepository);

  @override
  Future<Either<Failure, List<Message>>> call(ChatParams params) async {
    return await messageRepository.getAllMessages(
        chatRoomId: params.chatRoomId);
  }
}

class ChatParams {
  final String chatRoomId;

  ChatParams({
    required this.chatRoomId,
  });
}

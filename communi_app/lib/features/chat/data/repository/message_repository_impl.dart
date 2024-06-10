import 'package:communi_app/core/error/exception.dart';
import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/features/chat/data/datasource/chat_data_source.dart';
import 'package:communi_app/features/chat/data/model/message_model.dart';
import 'package:communi_app/features/chat/domain/entity/message.dart';
import 'package:communi_app/features/chat/domain/repository/message_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

class MessageRepositoryImpl implements MessageRepository {
  final ChatDataSource chatDataSource;
  MessageRepositoryImpl(this.chatDataSource);

  @override
  Future<Either<Failure, Message>> sendMessage({
    required String userId,
    required String chatRoomId,
    required String message,
  }) async {
    try {
      MessageModel messageModel = MessageModel(
        id: const Uuid().v1(),
        userId: userId,
        chatRoomId: chatRoomId,
        message: message,
      );

      final sentMessage = await chatDataSource.sendMessage(messageModel);
      return right(sentMessage);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getAllMessages(
      {required String chatRoomId}) async {
    try {
      final messages = await chatDataSource.getAllMessages(chatRoomId);
      return right(messages);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

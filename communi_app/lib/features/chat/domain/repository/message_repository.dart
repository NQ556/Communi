import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/features/chat/domain/entity/message.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class MessageRepository {
  Future<Either<Failure, Message>> sendMessage({
    required String userId,
    required String chatRoomId,
    required String message,
  });

  Future<Either<Failure, List<Message>>> getAllMessages(
      {required String chatRoomId});
}

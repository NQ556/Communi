import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/core/common/entities/chat_room.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ChatRoomRepository {
  Future<Either<Failure, ChatRoom>> addNewChatRoom({
    required String userId,
    required String name,
  });

  Future<Either<Failure, List<ChatRoom>>> getAllChatRooms();
}

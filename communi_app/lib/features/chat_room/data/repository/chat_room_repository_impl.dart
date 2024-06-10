import 'package:communi_app/core/error/exception.dart';
import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/features/chat_room/data/datasources/chat_room_data_source.dart';
import 'package:communi_app/features/chat_room/data/models/chat_room_model.dart';
import 'package:communi_app/features/chat_room/domain/entities/chat_room.dart';
import 'package:communi_app/features/chat_room/domain/repository/chat_room_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:uuid/uuid.dart';

class ChatRoomRepositoryImpl implements ChatRoomRepository {
  final ChatRoomDataSource chatRoomDataSource;
  ChatRoomRepositoryImpl(this.chatRoomDataSource);

  @override
  Future<Either<Failure, ChatRoom>> addNewChatRoom(
      {required String userId, required String name}) async {
    try {
      ChatRoomModel chatRoomModel = ChatRoomModel(
        id: const Uuid().v1(),
        userId: userId,
        name: name,
      );

      final chatRoom = await chatRoomDataSource.addNewChatRoom(chatRoomModel);
      return right(chatRoom);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

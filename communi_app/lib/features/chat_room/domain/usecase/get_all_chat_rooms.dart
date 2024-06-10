import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/core/usecase/usecase.dart';
import 'package:communi_app/core/common/entities/chat_room.dart';
import 'package:communi_app/features/chat_room/domain/repository/chat_room_repository.dart';
import 'package:fpdart/src/either.dart';

class GetAllChatRooms implements Usecase<List<ChatRoom>, NoParams> {
  final ChatRoomRepository chatRoomRepository;
  GetAllChatRooms(this.chatRoomRepository);

  @override
  Future<Either<Failure, List<ChatRoom>>> call(NoParams params) async {
    return await chatRoomRepository.getAllChatRooms();
  }
}

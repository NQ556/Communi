import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/core/usecase/usecase.dart';
import 'package:communi_app/core/common/entities/chat_room.dart';
import 'package:communi_app/features/chat_room/domain/repository/chat_room_repository.dart';
import 'package:fpdart/src/either.dart';

class AddChatRoom implements Usecase<ChatRoom, ChatRoomParams> {
  final ChatRoomRepository chatRoomRepository;
  AddChatRoom(this.chatRoomRepository);

  @override
  Future<Either<Failure, ChatRoom>> call(ChatRoomParams params) async {
    return await chatRoomRepository.addNewChatRoom(
      userId: params.userId,
      name: params.name,
    );
  }
}

class ChatRoomParams {
  final String userId;
  final String name;

  ChatRoomParams({
    required this.userId,
    required this.name,
  });
}

import 'package:communi_app/core/error/exception.dart';
import 'package:communi_app/features/chat_room/data/models/chat_room_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ChatRoomDataSource {
  Future<ChatRoomModel> addNewChatRoom(ChatRoomModel chatRoom);
}

class ChatRoomDataSourceImpl implements ChatRoomDataSource {
  final SupabaseClient supabaseClient;
  ChatRoomDataSourceImpl(this.supabaseClient);

  @override
  Future<ChatRoomModel> addNewChatRoom(ChatRoomModel chatRoom) async {
    try {
      final chatRoomData = await supabaseClient
          .from('chat_rooms')
          .insert(chatRoom.toMap())
          .select();

      return ChatRoomModel.fromMap(chatRoomData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

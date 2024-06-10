import 'package:communi_app/core/error/exception.dart';
import 'package:communi_app/features/chat/data/model/message_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ChatDataSource {
  Future<MessageModel> sendMessage(MessageModel message);
  //Future<List<ChatRoomModel>> getAllChatRooms();
}

class ChatDataSourceImpl extends ChatDataSource {
  final SupabaseClient supabaseClient;
  ChatDataSourceImpl(this.supabaseClient);

  @override
  Future<MessageModel> sendMessage(MessageModel message) async {
    try {
      final messageData = await supabaseClient
          .from('messages')
          .insert(message.toMap())
          .select();
      return MessageModel.fromMap(messageData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

import 'package:communi_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:communi_app/core/common/functions/show_snackbar.dart';
import 'package:communi_app/core/utils/asset_manager.dart';
import 'package:communi_app/core/utils/color_manager.dart';
import 'package:communi_app/core/utils/string_manager.dart';
import 'package:communi_app/core/common/widgets/input_box.dart';
import 'package:communi_app/core/common/entities/chat_room.dart';
import 'package:communi_app/features/chat/presentation/bloc/message_bloc.dart';
import 'package:communi_app/features/chat/presentation/widgets/message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.chatRoom});
  final ChatRoom chatRoom;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context
        .read<MessageBloc>()
        .add(FetchAllMessages(chatRoomId: widget.chatRoom.id));
  }

  @override
  void dispose() {
    super.dispose();

    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<AppUserCubit>().state as AppUserSignedIn);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // Chat Area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Sized Box
                  SizedBox(
                    height: 10,
                  ),

                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 30,
                        ),
                      ),

                      // Group chat name
                      Text(
                        widget.chatRoom.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      // Sized box
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),

                  // Chat
                  BlocConsumer<MessageBloc, MessageState>(
                    listener: (context, state) {
                      if (state is MessageFailure) {
                        showSnackBar(context, state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is MessageDisplaySuccess) {
                        return Column(
                          children: [
                            for (int i = 0; i < state.messages.length; i++)
                              Align(
                                alignment: state.messages[i].userId == userId
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: MessageView(
                                  message: state.messages[i].message,
                                  color: ColorManager.lightGreen,
                                  username: state.messages[i].username,
                                ),
                              ),
                          ],
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),

          // Input area
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Chat box
                  InputBox(
                    hintText: StringManager.enter,
                    textEditingController: textController,
                  ),

                  // Sized box
                  SizedBox(
                    width: 30,
                  ),

                  // Send button
                  IconButton(
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        context.read<MessageBloc>().add(
                              MessageAdd(
                                userId: userId.user.id,
                                chatRoomId: widget.chatRoom.id,
                                message: textController.text.trim(),
                              ),
                            );
                      }
                    },
                    icon: SvgPicture.asset(
                      ImageManager.sendIcon,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

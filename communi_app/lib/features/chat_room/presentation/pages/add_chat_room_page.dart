import 'package:communi_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:communi_app/core/common/functions/show_snackbar.dart';
import 'package:communi_app/core/common/widgets/input_box.dart';
import 'package:communi_app/core/common/widgets/rounded_button.dart';
import 'package:communi_app/core/utils/string_manager.dart';
import 'package:communi_app/features/chat_room/presentation/bloc/chat_room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddChatRoomPage extends StatefulWidget {
  const AddChatRoomPage({super.key});

  @override
  State<AddChatRoomPage> createState() => _AddChatRoomPageState();
}

class _AddChatRoomPageState extends State<AddChatRoomPage> {
  final textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocListener<ChatRoomBloc, ChatRoomState>(
        listener: (context, state) {
          if (state is ChatRoomFailure) {
            showSnackBar(context, state.error);
          } else {
            textController.clear();
          }
        },
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 30,
                  ),
                ),

                // Group chat name
                Text(
                  StringManager.createChatRoom,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                // Sized box
                SizedBox(
                  width: 30,
                ),
              ],
            ),

            //
            SizedBox(
              height: 30,
            ),

            // Input name
            InputBox(
              hintText: StringManager.enterChatRoom,
              textEditingController: textController,
            ),

            //
            SizedBox(
              height: 30,
            ),

            // Add button
            RoundedButton(
              buttonText: StringManager.create,
              onTap: () {
                if (textController.text.isNotEmpty) {
                  final userId =
                      (context.read<AppUserCubit>().state as AppUserSignedIn);

                  context.read<ChatRoomBloc>().add(ChatRoomAdd(
                        userId: userId.user.id,
                        name: textController.text.trim(),
                      ));
                }
              },
            )
          ],
        ),
      )),
    );
  }
}

import 'package:communi_app/core/common/functions/show_snackbar.dart';
import 'package:communi_app/core/common/widgets/loader.dart';
import 'package:communi_app/core/utils/string_manager.dart';
import 'package:communi_app/features/chat_room/presentation/bloc/chat_room_bloc.dart';
import 'package:communi_app/features/chat_room/presentation/widgets/chat_room_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<ChatRoomBloc>().add(FetchAllChatRooms());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ChatRoomBloc, ChatRoomState>(
          listener: (context, state) {
            if (state is ChatRoomFailure) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is ChatRoomLoading) {
              return Loader();
            }

            if (state is ChatRoomDisplaySuccess) {
              return Column(
                children: [
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

                      // App name
                      Text(
                        StringManager.appName,
                        style: Theme.of(context).textTheme.headlineSmall,
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

                  // Chat rooms
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.chatRooms.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ChatRoomBox(
                              name: state.chatRooms[index].name,
                              creator: state.chatRooms[index].creatorName!),
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}

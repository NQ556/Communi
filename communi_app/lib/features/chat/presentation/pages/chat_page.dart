import 'package:communi_app/core/utils/asset_manager.dart';
import 'package:communi_app/core/utils/string_manager.dart';
import 'package:communi_app/core/common/widgets/input_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
                        "Group Chat 1",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      // Sized box
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),

                  // Chat
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
                    onPressed: () {},
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

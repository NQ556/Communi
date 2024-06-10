import 'package:communi_app/core/utils/color_manager.dart';
import 'package:communi_app/core/utils/font_manager.dart';
import 'package:flutter/material.dart';

class ChatRoomBox extends StatelessWidget {
  const ChatRoomBox({super.key, required this.name, required this.creator});
  final String name;
  final String creator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: ColorManager.lightGreen,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeightManager.bold,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              creator,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeightManager.bold,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

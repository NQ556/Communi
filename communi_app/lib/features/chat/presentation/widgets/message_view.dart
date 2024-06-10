import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView(
      {super.key, required this.message, required this.color, this.username});
  final String message;
  final Color color;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          username!,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 180),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}

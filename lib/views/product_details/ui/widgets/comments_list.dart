import 'package:flutter/material.dart';

class CommentslList extends StatelessWidget {
  const CommentslList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => const UserComment(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10);
  }
}

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text(
              'User Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          children: [Text('comment')],
        ),
        Row(
          children: [
            Text(
              'Replay',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          children: [Text('replay')],
        )
      ],
    );
  }
}

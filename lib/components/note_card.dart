import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/Note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final Function onPressed;

  NoteCard({this.note, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: kLargeMargin, vertical: kSmallMargin),
        child: ListTile(
          title: Text(note.title),
          subtitle: Text(note.note),
        ),
      ),
    );
  }
}

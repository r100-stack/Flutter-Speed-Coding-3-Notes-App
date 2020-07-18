import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/components/note_card.dart';
import 'package:notes_app/models/Note.dart';
import 'package:notes_app/screens/note_screen.dart';

class NotesStream extends StatelessWidget {
  final Firestore _firestore;

  NotesStream({firestore}) : _firestore = firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('notes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            backgroundColor: Colors.limeAccent,
          );
        }

        final notes = snapshot.data.documents;
        List<NoteCard> noteCards = [];
        for (var note in notes) {
          Note noteObject =
          Note(id: note.documentID, title: note.data['title'], note: note.data['note']);
          noteCards.add(NoteCard(
            note: noteObject,
            onPressed: () {
              Navigator.pushNamed(context, NoteScreen.routeName,
                  arguments: noteObject);
            },
          ));
        }

        return Column(
          children: noteCards,
        );
      },
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/components/notes_stream.dart';
import 'package:notes_app/components/note_card.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/Note.dart';
import 'package:notes_app/screens/note_screen.dart';

class NotesScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Notes'),
      ),
      body: ListView(
        children: <Widget>[NotesStream(firestore: _firestore)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NoteScreen.routeName);
        },
        backgroundColor: Colors.limeAccent,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

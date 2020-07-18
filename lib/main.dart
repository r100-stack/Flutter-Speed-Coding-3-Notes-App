import 'package:flutter/material.dart';
import 'package:notes_app/screens/note_screen.dart';
import 'package:notes_app/screens/notes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NotesScreen.routeName,
//      routes: {
//        NotesScreen.routeName: (context) => NotesScreen(),
//        NoteScreen.routeName: (context) => NoteScreen()
//      },
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          NotesScreen.routeName: (context) => NotesScreen(),
          NoteScreen.routeName: (context) => NoteScreen(settings.arguments)
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}

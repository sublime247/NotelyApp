import 'package:flutter/material.dart';
import 'package:notely/model/note_data.dart';
import 'package:notely/model/notes.dart';
import 'package:notely/service/database.dart';
import 'package:provider/provider.dart';

class CreatedNotes extends StatefulWidget {
  const CreatedNotes({ required this.deleteNotes, Key? key})
      : super(key: key);
 
  final Function deleteNotes;

  @override
  State<CreatedNotes> createState() => _CreatedNotesState();
}

class _CreatedNotesState extends State<CreatedNotes> {
   
  @override
  Widget build(BuildContext context) {
   final readNote = Provider.of<DataBase>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF8EEE2),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.menu_open,
                        size: 30,
                      ),
                      Spacer(),
                      Text(
                        'All Notes',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      Icon(Icons.search, size: 30),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: StreamBuilder<List<NoteData>>(
                        stream: readNote.readNote(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            final notes = snapshot.data;
                            final children = notes
                                .map((note) => Container(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  note.title,
                                                  style: const TextStyle(
                                                      fontFamily: 'Nunito',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                Expanded(
                                                  child: IconButton(
                                                    onPressed: () =>
                                                        setState(() {
                                                      widget.deleteNotes(
                                                          notes.id);
                                                    }),
                                                    icon:
                                                        const Icon(Icons.close),
                                                    iconSize: 20,
                                                  ),
                                                ),
                                              ]),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              note.description,
                                              style: const TextStyle(
                                                  fontFamily: 'Nunito',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList();
                            return GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.8,
                                ),
                                children: children);
                          }

                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      )),
                ]))));
  }
}

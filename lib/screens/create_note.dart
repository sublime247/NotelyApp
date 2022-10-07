// ignore_for_file: await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notely/model/note_data.dart';
import 'package:notely/service/database.dart';
import 'package:provider/provider.dart';

import '../model/notes.dart';
import '../service/firebase_service_auth.dart';
import 'notes_created.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  List<Notes> notes = [];
  TextEditingController titleController = TextEditingController();
  final descriptionController = TextEditingController();
  void addNewNote(context)  {
    final dataBase = Provider.of<DataBase>(context, listen: false);
     dataBase.createNote(NoteData(
      title: titleController.text,
       description: descriptionController.text));

    int id = notes.length + 1;
    int ids = id++;
    final newNote = Notes(
        title: titleController.text,
        description: descriptionController.text,
        id: ids);
    if (titleController.text.isEmpty) {
      return;
    }
    if (descriptionController.text.isEmpty) {
      return;
    }

    setState(() {
      notes.add(newNote);
      titleController.clear();
      descriptionController.clear();
    });
  }

  void deleteNotes(int id) {
    setState(() {
      notes.removeWhere((list) => list.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    return StreamBuilder(
        stream: auth.authstateChange(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data as User?;
            return MultiProvider(
              providers: [
              Provider<DataBase>(
                  create: (context) => FireStoreDataBase(uid: user!.uid),
                  builder: (context, child) {
                    return Scaffold(
                      floatingActionButton: FloatingActionButton(
                          onPressed: () => addNewNote(context),
                          child: const Icon(
                            Icons.save,
                            size: 50,
                          )),
                      backgroundColor: const Color(0xFFF8EEE2),
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => 
                                              CreatedNotes(
                                                    
                                                    deleteNotes: deleteNotes,
                                                  ))),
                                      child: const Icon(
                                        Icons.arrow_back_ios,
                                        size: 20,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      'Create Note',
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.more_vert, size: 20),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 150,
                                  child: TextFormField(
                                    // initialValue:widget.title ,
                                    maxLines:3,
                                    controller: titleController,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Color(0xFFF8EEE2),
                                      hintText: 'Title',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 300,
                                  child: TextFormField(
                                    controller: descriptionController,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Color(0xFFF8EEE2),
                                      hintText: 'Description',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
           ] );
          }
          return const Center(child: CircularProgressIndicator());
        }));
  }
}

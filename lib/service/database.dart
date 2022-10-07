import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notely/model/note_data.dart';

import '../model/api_path.dart';

abstract class DataBase {
  void createNote(NoteData notes);
 Stream<List<NoteData>>?  readNote();
}

final noteId = DateTime.now().toIso8601String();

class FireStoreDataBase implements DataBase {
  FireStoreDataBase({required this.uid});
  final String uid;

  @override
  void createNote(NoteData notes) =>
      _createNote(path: APIPATH.path(uid, noteId), notes: notes.toMap());
  @override
  Stream<List<NoteData>>? readNote(){
    final path = APIPATH.readPath(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    snapshots.map((snapshot) => snapshot.docs.map((snapshot) {
          final data = snapshot.data();
          return NoteData(
              title: data['title'],
              description: data['description']);
        }).toList());
  }

  void _createNote(
      {required String path, required Map<String, dynamic> notes}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(notes);
  }
}

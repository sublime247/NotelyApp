class NoteData {
  NoteData({required this.title, required this.description});
  final String title;
  final String description;
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'decription':description
    };
  }
}

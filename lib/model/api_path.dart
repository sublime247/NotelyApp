class APIPATH {
  static String path(String uid, String noteId) => 'users/$uid/notes/$noteId';
  static String readPath(String uid)=> 'users/$uid/notes';
  
}

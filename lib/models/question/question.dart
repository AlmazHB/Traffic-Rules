class Question {
  final String id;
  final String sorag;
  final Map<String, bool> jogaplar;
  final String surat;

  Question(
     {
    required this.id,
    required this.sorag,
    required this.jogaplar,
    required this.surat,
  });

  @override
  String toString() {
    return 'Question(id: $id, sorag: $sorag, jogaplar: $jogaplar,surat:$surat)';
  }
}

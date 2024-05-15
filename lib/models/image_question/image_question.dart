class ImageQeustion {
  ImageQeustion(
      {required this.id, required this.sorag, required this.suratlar});
  final String id;
  final String sorag;
  final Map<String, bool> suratlar;
  @override
  String toString() {
    return 'Question(id: $id, sorag: $sorag, suratlar: $suratlar,)';
  }
}

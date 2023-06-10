class DiagnosisPageStates {
  const DiagnosisPageStates({this.index = 0});
  final int index;

  DiagnosisPageStates copywith({int? index}) {
    return DiagnosisPageStates(index: index ?? this.index);
  }
}

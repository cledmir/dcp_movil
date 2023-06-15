class InformationPageStates {
  const InformationPageStates({this.index = 0});
  final int index;

  InformationPageStates copywith({int? index}) {
    return InformationPageStates(index: index ?? this.index);
  }
}

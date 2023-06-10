class HomePageStates {
  const HomePageStates({this.index = 0});
  final int index;

  HomePageStates copywith({int? index}) {
    return HomePageStates(index: index ?? this.index);
  }
}

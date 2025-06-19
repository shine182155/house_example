class HomeState {
  late int currentIndex;
  late DateTime? currentBackPressTime;

  HomeState() {
    ///Initialize variables
    currentBackPressTime = null;
    currentIndex = 0;
  }
}

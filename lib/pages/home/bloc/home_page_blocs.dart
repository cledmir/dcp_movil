import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcp_movil/pages/home/bloc/home_page_events.dart';
import 'package:dcp_movil/pages/home/bloc/home_page_states.dart';

class HomepageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomepageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copywith(index: event.index));
  }
}

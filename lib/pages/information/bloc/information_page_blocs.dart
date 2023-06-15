import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcp_movil/pages/information/bloc/information_page_events.dart';
import 'package:dcp_movil/pages/information/bloc/information_page_states.dart';

class InformationpageBlocs
    extends Bloc<InformationPageEvents, InformationPageStates> {
  InformationpageBlocs() : super(const InformationPageStates()) {
    on<InformationPageDots>(_informationPageDots);
  }

  void _informationPageDots(
      InformationPageDots event, Emitter<InformationPageStates> emit) {
    emit(state.copywith(index: event.index));
  }
}

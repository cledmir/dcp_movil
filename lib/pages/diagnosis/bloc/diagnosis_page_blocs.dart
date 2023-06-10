import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcp_movil/pages/diagnosis/bloc/diagnosis_page_events.dart';
import 'package:dcp_movil/pages/diagnosis/bloc/diagnosis_page_states.dart';

class DiagnosispageBlocs
    extends Bloc<DiagnosisPageEvents, DiagnosisPageStates> {
  DiagnosispageBlocs() : super(const DiagnosisPageStates()) {
    on<DiagnosisPageDots>(_diagnosisPageDots);
  }

  void _diagnosisPageDots(
      DiagnosisPageDots event, Emitter<DiagnosisPageStates> emit) {
    emit(state.copywith(index: event.index));
  }
}

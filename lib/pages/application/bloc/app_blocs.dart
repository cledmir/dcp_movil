import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcp_movil/pages/application/bloc/app_events.dart';
import 'package:dcp_movil/pages/application/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppSatate> {
  AppBlocs() : super(const AppSatate()) {
    on<TrigerAppEvent>((event, emit) {
      //print("my tapped index us ${event.index}");
      emit(AppSatate(index: event.index));
    });
  }
}

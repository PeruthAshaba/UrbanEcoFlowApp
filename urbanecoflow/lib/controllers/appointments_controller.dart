import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urbanecoflow/models/appointment_model.dart';
import 'package:urbanecoflow/services/appointment_service.dart';

import '../core/state.dart';

final allAppointmentsProvider =
    StateNotifierProvider<_AllAppointmentsNotifier, AppState<List<AppointmentModel>>>(
        (ref) {
  return _AllAppointmentsNotifier();
});

class _AllAppointmentsNotifier extends StateNotifier<AppState<List<AppointmentModel>>> {
  _AllAppointmentsNotifier() : super(AppState(status: Status.initial,data: [])) {
    getAppointments();
  }
  getAppointments() async {
    state = state.copyWith(status: Status.loading);
    var data = await AppointmentService.getAppointments();
    data.fold((l) => state = state.copyWith(status: Status.error, message: l),
        (r) => state = state.copyWith(status: Status.loaded, data: r));
  }
}

final appointmentCRUDProvider =
    StateNotifierProvider<_AppointmentCRUDNotifier, AppState<String>>(
        (ref) {
  return _AppointmentCRUDNotifier();
});

class _AppointmentCRUDNotifier extends StateNotifier<AppState<String>> {
  _AppointmentCRUDNotifier() : super(AppState(status: Status.initial));

  addAppointment(AppointmentModel appointmentModel) async {
    state = state.copyWith(status: Status.loading);
    var data = await AppointmentService.addAppointment(appointmentModel);
    data.fold((l) => state = state.copyWith(status: Status.error, message: l),
        (r) => state = state.copyWith(status: Status.loaded, data: r));
  }
  deleteAppointment({
    required String id
  }) async {
    state = state.copyWith(status: Status.loading);
    var data = await AppointmentService.deleteAppointment(id);
    data.fold((l) => state = state.copyWith(status: Status.error, message: l),
        (r) => state = state.copyWith(status: Status.loaded, data: r));
  }
}

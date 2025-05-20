import 'package:alarm_app/helpers/location_service/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/location_fetch_source.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> fetchLocation(LocationFetchSource source) async {
    try {
      emit(LocationLoading(source));
      final position = await LocationService.getCurrentLocation();

      if (position != null) {
        final locationName = await LocationService.getLocationName(position);
        if (locationName != null) {
          emit(LocationLoaded(locationName));
        } else {
          emit(LocationError('Location name could not be resolved.'));
        }
      } else {
        emit(
            LocationError('Location not available. Please enable services and grant permissions.'));
      }
    } catch (e) {
      emit(LocationError("Failed to get location: $e"));
    }
  }
}

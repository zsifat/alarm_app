import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/location_fetch_source.dart';

abstract class LocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {
  final LocationFetchSource source;
  LocationLoading(this.source);
  @override
  List<Object?> get props => [source];
}

class LocationLoaded extends LocationState {
  final String locationName;

  LocationLoaded(this.locationName);

  @override
  List<Object?> get props => [locationName];
}

class LocationServiceDisabled extends LocationState {}


class LocationError extends LocationState {
  final String message;

  LocationError(this.message);

  @override
  List<Object?> get props => [message];
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

enum PlaceType {
  popular,
  architecture,
  parks,
  gastronomy,
}

@freezed
class Place with _$Place {
  const factory Place({
    required String id,
    required String title,
    required String description,
    required String image,
    required Coordinates coordinates,
    @Default(false) bool wasHere,
    required List<PlaceType> type,
    @Default(false) bool isUserAdded,
    @Default(false) bool isFavorite,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    required double latitude,
    required double longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);
}

@freezed
class PlacesResponse with _$PlacesResponse {
  const factory PlacesResponse({
    required List<Place> places,
  }) = _PlacesResponse;

  factory PlacesResponse.fromJson(Map<String, dynamic> json) => _$PlacesResponseFromJson(json);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  coordinates: Coordinates.fromJson(
    json['coordinates'] as Map<String, dynamic>,
  ),
  wasHere: json['wasHere'] as bool? ?? false,
  type:
      (json['type'] as List<dynamic>)
          .map((e) => $enumDecode(_$PlaceTypeEnumMap, e))
          .toList(),
  isUserAdded: json['isUserAdded'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'coordinates': instance.coordinates,
      'wasHere': instance.wasHere,
      'type': instance.type.map((e) => _$PlaceTypeEnumMap[e]!).toList(),
      'isUserAdded': instance.isUserAdded,
      'isFavorite': instance.isFavorite,
    };

const _$PlaceTypeEnumMap = {
  PlaceType.popular: 'popular',
  PlaceType.architecture: 'architecture',
  PlaceType.parks: 'parks',
  PlaceType.gastronomy: 'gastronomy',
};

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$PlacesResponseImpl _$$PlacesResponseImplFromJson(Map<String, dynamic> json) =>
    _$PlacesResponseImpl(
      places:
          (json['places'] as List<dynamic>)
              .map((e) => Place.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$PlacesResponseImplToJson(
  _$PlacesResponseImpl instance,
) => <String, dynamic>{'places': instance.places};

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  Coordinates get coordinates => throw _privateConstructorUsedError;
  bool get wasHere => throw _privateConstructorUsedError;
  List<PlaceType> get type => throw _privateConstructorUsedError;
  bool get isUserAdded => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String image,
    Coordinates coordinates,
    bool wasHere,
    List<PlaceType> type,
    bool isUserAdded,
    bool isFavorite,
  });

  $CoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? coordinates = null,
    Object? wasHere = null,
    Object? type = null,
    Object? isUserAdded = null,
    Object? isFavorite = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            coordinates:
                null == coordinates
                    ? _value.coordinates
                    : coordinates // ignore: cast_nullable_to_non_nullable
                        as Coordinates,
            wasHere:
                null == wasHere
                    ? _value.wasHere
                    : wasHere // ignore: cast_nullable_to_non_nullable
                        as bool,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as List<PlaceType>,
            isUserAdded:
                null == isUserAdded
                    ? _value.isUserAdded
                    : isUserAdded // ignore: cast_nullable_to_non_nullable
                        as bool,
            isFavorite:
                null == isFavorite
                    ? _value.isFavorite
                    : isFavorite // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res> get coordinates {
    return $CoordinatesCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
    _$PlaceImpl value,
    $Res Function(_$PlaceImpl) then,
  ) = __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String image,
    Coordinates coordinates,
    bool wasHere,
    List<PlaceType> type,
    bool isUserAdded,
    bool isFavorite,
  });

  @override
  $CoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
    _$PlaceImpl _value,
    $Res Function(_$PlaceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? coordinates = null,
    Object? wasHere = null,
    Object? type = null,
    Object? isUserAdded = null,
    Object? isFavorite = null,
  }) {
    return _then(
      _$PlaceImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        coordinates:
            null == coordinates
                ? _value.coordinates
                : coordinates // ignore: cast_nullable_to_non_nullable
                    as Coordinates,
        wasHere:
            null == wasHere
                ? _value.wasHere
                : wasHere // ignore: cast_nullable_to_non_nullable
                    as bool,
        type:
            null == type
                ? _value._type
                : type // ignore: cast_nullable_to_non_nullable
                    as List<PlaceType>,
        isUserAdded:
            null == isUserAdded
                ? _value.isUserAdded
                : isUserAdded // ignore: cast_nullable_to_non_nullable
                    as bool,
        isFavorite:
            null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceImpl implements _Place {
  const _$PlaceImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.coordinates,
    this.wasHere = false,
    required final List<PlaceType> type,
    this.isUserAdded = false,
    this.isFavorite = false,
  }) : _type = type;

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;
  @override
  final Coordinates coordinates;
  @override
  @JsonKey()
  final bool wasHere;
  final List<PlaceType> _type;
  @override
  List<PlaceType> get type {
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_type);
  }

  @override
  @JsonKey()
  final bool isUserAdded;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'Place(id: $id, title: $title, description: $description, image: $image, coordinates: $coordinates, wasHere: $wasHere, type: $type, isUserAdded: $isUserAdded, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.wasHere, wasHere) || other.wasHere == wasHere) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            (identical(other.isUserAdded, isUserAdded) ||
                other.isUserAdded == isUserAdded) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    image,
    coordinates,
    wasHere,
    const DeepCollectionEquality().hash(_type),
    isUserAdded,
    isFavorite,
  );

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(this);
  }
}

abstract class _Place implements Place {
  const factory _Place({
    required final String id,
    required final String title,
    required final String description,
    required final String image,
    required final Coordinates coordinates,
    final bool wasHere,
    required final List<PlaceType> type,
    final bool isUserAdded,
    final bool isFavorite,
  }) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get image;
  @override
  Coordinates get coordinates;
  @override
  bool get wasHere;
  @override
  List<PlaceType> get type;
  @override
  bool get isUserAdded;
  @override
  bool get isFavorite;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return _Coordinates.fromJson(json);
}

/// @nodoc
mixin _$Coordinates {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this Coordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoordinatesCopyWith<Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatesCopyWith<$Res> {
  factory $CoordinatesCopyWith(
    Coordinates value,
    $Res Function(Coordinates) then,
  ) = _$CoordinatesCopyWithImpl<$Res, Coordinates>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$CoordinatesCopyWithImpl<$Res, $Val extends Coordinates>
    implements $CoordinatesCopyWith<$Res> {
  _$CoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      _value.copyWith(
            latitude:
                null == latitude
                    ? _value.latitude
                    : latitude // ignore: cast_nullable_to_non_nullable
                        as double,
            longitude:
                null == longitude
                    ? _value.longitude
                    : longitude // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoordinatesImplCopyWith<$Res>
    implements $CoordinatesCopyWith<$Res> {
  factory _$$CoordinatesImplCopyWith(
    _$CoordinatesImpl value,
    $Res Function(_$CoordinatesImpl) then,
  ) = __$$CoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$CoordinatesImplCopyWithImpl<$Res>
    extends _$CoordinatesCopyWithImpl<$Res, _$CoordinatesImpl>
    implements _$$CoordinatesImplCopyWith<$Res> {
  __$$CoordinatesImplCopyWithImpl(
    _$CoordinatesImpl _value,
    $Res Function(_$CoordinatesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      _$CoordinatesImpl(
        latitude:
            null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                    as double,
        longitude:
            null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordinatesImpl implements _Coordinates {
  const _$CoordinatesImpl({required this.latitude, required this.longitude});

  factory _$CoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatesImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'Coordinates(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatesImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatesImplCopyWith<_$CoordinatesImpl> get copyWith =>
      __$$CoordinatesImplCopyWithImpl<_$CoordinatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatesImplToJson(this);
  }
}

abstract class _Coordinates implements Coordinates {
  const factory _Coordinates({
    required final double latitude,
    required final double longitude,
  }) = _$CoordinatesImpl;

  factory _Coordinates.fromJson(Map<String, dynamic> json) =
      _$CoordinatesImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoordinatesImplCopyWith<_$CoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlacesResponse _$PlacesResponseFromJson(Map<String, dynamic> json) {
  return _PlacesResponse.fromJson(json);
}

/// @nodoc
mixin _$PlacesResponse {
  List<Place> get places => throw _privateConstructorUsedError;

  /// Serializes this PlacesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlacesResponseCopyWith<PlacesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesResponseCopyWith<$Res> {
  factory $PlacesResponseCopyWith(
    PlacesResponse value,
    $Res Function(PlacesResponse) then,
  ) = _$PlacesResponseCopyWithImpl<$Res, PlacesResponse>;
  @useResult
  $Res call({List<Place> places});
}

/// @nodoc
class _$PlacesResponseCopyWithImpl<$Res, $Val extends PlacesResponse>
    implements $PlacesResponseCopyWith<$Res> {
  _$PlacesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? places = null}) {
    return _then(
      _value.copyWith(
            places:
                null == places
                    ? _value.places
                    : places // ignore: cast_nullable_to_non_nullable
                        as List<Place>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlacesResponseImplCopyWith<$Res>
    implements $PlacesResponseCopyWith<$Res> {
  factory _$$PlacesResponseImplCopyWith(
    _$PlacesResponseImpl value,
    $Res Function(_$PlacesResponseImpl) then,
  ) = __$$PlacesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Place> places});
}

/// @nodoc
class __$$PlacesResponseImplCopyWithImpl<$Res>
    extends _$PlacesResponseCopyWithImpl<$Res, _$PlacesResponseImpl>
    implements _$$PlacesResponseImplCopyWith<$Res> {
  __$$PlacesResponseImplCopyWithImpl(
    _$PlacesResponseImpl _value,
    $Res Function(_$PlacesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? places = null}) {
    return _then(
      _$PlacesResponseImpl(
        places:
            null == places
                ? _value._places
                : places // ignore: cast_nullable_to_non_nullable
                    as List<Place>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacesResponseImpl implements _PlacesResponse {
  const _$PlacesResponseImpl({required final List<Place> places})
    : _places = places;

  factory _$PlacesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacesResponseImplFromJson(json);

  final List<Place> _places;
  @override
  List<Place> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'PlacesResponse(places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacesResponseImpl &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  /// Create a copy of PlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacesResponseImplCopyWith<_$PlacesResponseImpl> get copyWith =>
      __$$PlacesResponseImplCopyWithImpl<_$PlacesResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacesResponseImplToJson(this);
  }
}

abstract class _PlacesResponse implements PlacesResponse {
  const factory _PlacesResponse({required final List<Place> places}) =
      _$PlacesResponseImpl;

  factory _PlacesResponse.fromJson(Map<String, dynamic> json) =
      _$PlacesResponseImpl.fromJson;

  @override
  List<Place> get places;

  /// Create a copy of PlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacesResponseImplCopyWith<_$PlacesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

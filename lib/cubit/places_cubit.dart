import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/place_model.dart';

part 'places_cubit.freezed.dart';

@freezed
class PlacesState with _$PlacesState {
  const factory PlacesState.initial() = _Initial;
  const factory PlacesState.loading() = _Loading;
  const factory PlacesState.loaded(List<Place> places) = _Loaded;
  const factory PlacesState.error(String message) = _Error;
}

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit() : super(const PlacesState.initial());

  List<Place> _places = [];
  final String _userPlacesFile = "user_places.json";
  final String _favoritesKey = "favorite_places";

  Future<void> loadPlaces() async {
    emit(const PlacesState.loading());
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/places.json',
      );
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final placesResponse = PlacesResponse.fromJson(jsonMap);
      _places = List.from(placesResponse.places);

      final userPlaces = await _loadUserPlaces();
      _places.addAll(userPlaces);

      await _loadFavorites();

      emit(PlacesState.loaded(_places));
    } catch (e) {
      emit(PlacesState.error('Failed to load places: $e'));
    }
  }

  Future<List<Place>> _loadUserPlaces() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$_userPlacesFile');

      if (!file.existsSync()) return [];

      final jsonString = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => Place.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> _saveUserPlaces() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$_userPlacesFile');
      final userPlaces = _places.where((place) => place.isUserAdded).toList();
      await file.writeAsString(jsonEncode(userPlaces));
    } catch (e) {
      Logger().e("Error saving user places: $e");
    }
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteIds = prefs.getStringList(_favoritesKey);

    if (favoriteIds != null) {
      for (int i = 0; i < _places.length; i++) {
        if (favoriteIds.contains(_places[i].id)) {
          _places[i] = _places[i].copyWith(isFavorite: true);
        }
      }
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds =
        _places
            .where((place) => place.isFavorite)
            .map((place) => place.id)
            .toList();
    await prefs.setStringList(_favoritesKey, favoriteIds);
  }

  void addPlace(Place place) {
    _places.add(place);
    _saveUserPlaces();
    emit(PlacesState.loaded(List.from(_places)));
  }

  void editPlace(Place updatedPlace) {
    final index = _places.indexWhere((place) => place.id == updatedPlace.id);
    if (index != -1 && _places[index].isUserAdded) {
      _places[index] = updatedPlace;
      _saveUserPlaces();
      emit(PlacesState.loaded(List.from(_places)));
    }
  }

  void toggleFavorite(String placeId) async {
    Logger().i('Toggling favorite for place $placeId');
    final index = _places.indexWhere((place) => place.id == placeId);
    if (index != -1) {
      _places[index] = _places[index].copyWith(
        isFavorite: !_places[index].isFavorite,
      );
      await _saveFavorites();
      emit(PlacesState.loaded(List.from(_places)));
    }
  }

  void toggleWasHere(String placeId) {
    final index = _places.indexWhere((place) => place.id == placeId);
    if (index != -1) {
      _places[index] = _places[index].copyWith(
        wasHere: !_places[index].wasHere,
      );
      _saveUserPlaces();
      emit(PlacesState.loaded(List.from(_places)));
    }
  }
}

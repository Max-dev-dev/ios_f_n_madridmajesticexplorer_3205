import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/cubit/places_cubit.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/models/place_model.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/pages/add_place_screen.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/pages/edit_place_screen.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  Place? selectedPlace;
  double currentZoom = 13.0;
  List<String> selectedFilters = [];

  @override
  void initState() {
    super.initState();
    context.read<PlacesCubit>().loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlacesCubit, PlacesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error:
                (message) => Center(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
            loaded: (places) {
              final List<Marker> markers =
                  places
                      .where(
                        (place) =>
                            selectedFilters.isEmpty ||
                            place.type.any(
                              (type) => selectedFilters.contains(type.name),
                            ),
                      )
                      .map((place) {
                        return Marker(
                          point: LatLng(
                            place.coordinates.latitude,
                            place.coordinates.longitude,
                          ),
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPlace = place;
                                _mapController.move(
                                  LatLng(
                                    place.coordinates.latitude,
                                    place.coordinates.longitude,
                                  ),
                                  14.0,
                                );
                                _showPlaceInfo(context, place);
                              });
                            },
                            child: const Icon(
                              Icons.place,
                              color: Color(0xFFFC9B09),
                              size: 40,
                            ),
                          ),
                        );
                      })
                      .toList();

              return Stack(
                children: [
                  FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter:
                          markers.isNotEmpty
                              ? markers.first.point
                              : const LatLng(40.4168, -3.7038),
                      initialZoom: currentZoom,
                      minZoom: 2,
                      maxZoom: 18,
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.all,
                      ),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      ),
                      MarkerLayer(markers: markers),
                    ],
                  ),
                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF383838),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Text(
                            'Traveler`s Map',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Column(
                      children: [
                        FloatingActionButton(
                          heroTag: null,
                          backgroundColor: const Color(0xFFFC9B09),
                          shape: const CircleBorder(),
                          child: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const AddCustomPlaceScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 10),
                        FloatingActionButton(
                          heroTag: null,
                          backgroundColor: const Color(0xFF383838),
                          shape: const CircleBorder(),
                          child: const Icon(Icons.tune, color: Colors.white),
                          onPressed: () async {
                            bool? filtersUpdated = await _showFilterModal(
                              context,
                            );

                            if (filtersUpdated == true) {
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Future<bool?> _showFilterModal(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      backgroundColor: const Color(0xFF383838),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Filter by category",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        ["popular", "architecture", "parks", "gastronomy"].map((
                          type,
                        ) {
                          final isSelected = selectedFilters.contains(type);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedFilters.remove(type);
                                } else {
                                  selectedFilters.add(type);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? Colors.amber
                                        : const Color(0xFF151515),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              child: Text(
                                type.toUpperCase(),
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },

                      child: const Text(
                        "Apply Filters",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showPlaceInfo(BuildContext context, Place place) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF383838),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FractionallySizedBox(
              heightFactor: 0.75,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 48,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  place.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<PlacesCubit>()
                                            .toggleFavorite(place.id);
                                        setState(() {
                                          place = place.copyWith(
                                            isFavorite: !place.isFavorite,
                                          );
                                        });
                                      },
                                      icon: Icon(
                                        place.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color:
                                            place.isFavorite
                                                ? Colors.red
                                                : Colors.white,
                                      ),
                                    ),
                                    if (place.isUserAdded)
                                      const SizedBox(width: 6),
                                    if (place.isUserAdded)
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      EditUserPlaceScreen(
                                                        place: place,
                                                      ),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children:
                                  place.type.map((type) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF151515),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        width: 120,
                                        height: 55,
                                        child: Center(
                                          child: Text(
                                            type.name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Coordinates: ${place.coordinates.latitude}, ${place.coordinates.longitude}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                place.image,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              place.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              place.wasHere
                                  ? const Color(0xFF151515)
                                  : const Color(0xFFFC9B09),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          context.read<PlacesCubit>().toggleWasHere(place.id);
                          setState(() {
                            place = place.copyWith(wasHere: !place.wasHere);
                          });
                        },
                        child: Text(
                          place.wasHere ? 'Mark as Visited' : 'I was here',
                          style: TextStyle(
                            color:
                                place.wasHere
                                    ? Colors.amber
                                    : const Color(0xFF151515),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

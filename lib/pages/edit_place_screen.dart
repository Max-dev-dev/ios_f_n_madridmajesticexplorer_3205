import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../cubit/places_cubit.dart';
import '../models/place_model.dart';

class EditUserPlaceScreen extends StatefulWidget {
  final Place place;

  const EditUserPlaceScreen({super.key, required this.place});

  @override
  _EditUserPlaceScreenState createState() => _EditUserPlaceScreenState();
}

class _EditUserPlaceScreenState extends State<EditUserPlaceScreen> {
  late TextEditingController _titleController;
  late TextEditingController _latitudeController;
  late TextEditingController _longitudeController;
  late TextEditingController _descriptionController;
  File? _selectedImage;
  late List<PlaceType> _selectedTypes;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.place.title);
    _latitudeController = TextEditingController(
      text: widget.place.coordinates.latitude.toString(),
    );
    _longitudeController = TextEditingController(
      text: widget.place.coordinates.longitude.toString(),
    );
    _descriptionController = TextEditingController(
      text: widget.place.description,
    );
    _selectedImage =
        widget.place.image.isNotEmpty ? File(widget.place.image) : null;
    _selectedTypes = List.from(widget.place.type);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _toggleType(PlaceType type) {
    setState(() {
      _selectedTypes.contains(type)
          ? _selectedTypes.remove(type)
          : _selectedTypes.add(type);
    });
  }

  void _saveChanges() {
    final title = _titleController.text;
    final latitude = double.tryParse(_latitudeController.text);
    final longitude = double.tryParse(_longitudeController.text);
    final description = _descriptionController.text;

    if (title.isEmpty ||
        latitude == null ||
        longitude == null ||
        _selectedTypes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields and choose at least one category.",
          ),
        ),
      );
      return;
    }

    final updatedPlace = widget.place.copyWith(
      title: title,
      coordinates: Coordinates(latitude: latitude, longitude: longitude),
      description: description,
      image: _selectedImage?.path ?? widget.place.image,
      type: _selectedTypes,
    );

    context.read<PlacesCubit>().editPlace(updatedPlace);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: const Text("Edit place", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cover',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                      _selectedImage == null
                          ? const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.amber,
                              size: 40,
                            ),
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField("Enter title", _titleController),
              const SizedBox(height: 6),
              const Text(
                'Latitude',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField("Enter latitude", _latitudeController),
              const SizedBox(height: 6),
              const Text(
                'Longitude',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField("Enter longitude", _longitudeController),
              const SizedBox(height: 6),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(
                "Enter description",
                _descriptionController,
                maxLines: 3,
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
                  onPressed: _saveChanges,
                  child: const Text(
                    "Save Changes",
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
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: Color(0xFF151515)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFB8B8B8)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}

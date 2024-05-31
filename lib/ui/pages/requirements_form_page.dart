import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rqr_manx/data/requirements_repository.dart';
import 'package:rqr_manx/domain/requirements_model.dart';
import 'package:rqr_manx/services/geolocation_service.dart';
import 'package:rqr_manx/ui/components/custom_dropdown.dart';
import 'package:rqr_manx/ui/components/custom_textfield.dart';
import 'package:rqr_manx/ui/components/save_button.dart';

class RequirementsFormPage extends StatefulWidget {
  final int projectId;
  final Function refreshProjects;
  final int requirementId;

  const RequirementsFormPage({
    super.key,
    this.requirementId = 0,
    required this.projectId,
    required this.refreshProjects,
  });

  @override
  State<RequirementsFormPage> createState() => _RequirementsFormPageState();
}

class _RequirementsFormPageState extends State<RequirementsFormPage> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController hoursCtrl = TextEditingController();
  int selectedDifficulty = 0;
  int selectedPriority = 0;
  bool isLoading = true;
  String location = "";

  File? image1;
  File? image2;

  @override
  void initState() {
    super.initState();
    _loadRequirementData();
    _loadLocation();
  }

  Future<void> _openCamera() async {
    if (image1 != null && image2 != null) {
      image1 = null;
      image2 = null;
    }

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        if (image1 == null) {
          image1 = File(pickedFile.path);
        } else {
          image2 = File(pickedFile.path);
        }
      }
    });
  }

  Future<void> _loadLocation() async {
    GeolocationService geoService = GeolocationService();
    var geolocation = await geoService.getCurrentLocation();
    setState(() {
      location = geolocation;
    });
  }

  Future<void> _loadRequirementData() async {
    if (widget.requirementId > 0) {
      var data = await RequirementsRepository.getById(
          widget.requirementId, widget.projectId);
      var model = RequirementsModel.fromJson(data);

      nameCtrl.text = model.name;
      descriptionCtrl.text = model.description;
      hoursCtrl.text = model.hours.toString();
      setState(() {
        selectedDifficulty = model.difficulty;
        selectedPriority = model.priority;
        location = model.geolocation;
        image1 = model.image1;
        image2 = model.image2;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _saveRequirement(BuildContext context) {
    RequirementsModel model = RequirementsModel(
      projectId: widget.projectId,
      name: nameCtrl.text,
      description: descriptionCtrl.text,
      hours: double.parse(hoursCtrl.text),
    );

    model.difficulty = selectedDifficulty;
    model.priority = selectedPriority;
    model.type = 0;
    model.id = widget.requirementId;
    model.geolocation = location;
    model.image1 = image1;
    model.image2 = image2;

    if (model.id == 0) {
      RequirementsRepository.insert(model);
    } else {
      RequirementsRepository.update(model);
    }

    Navigator.pop(context);
    widget.refreshProjects();
  }

  void updateDifficulty(int newValue) {
    setState(() {
      selectedDifficulty = newValue;
    });
  }

  void updatePriority(int newValue) {
    setState(() {
      selectedPriority = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('RqrManx')),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('RqrManx')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(title: 'Name', controller: nameCtrl),
                CustomTextField(
                  title: 'Description',
                  controller: descriptionCtrl,
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  child: CustomTextField(title: 'Hours', controller: hoursCtrl),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropdown(
                      label: 'Difficulty Level',
                      items: const [
                        {'value': '0', 'label': 'Low'},
                        {'value': '1', 'label': 'Medium'},
                        {'value': '2', 'label': 'High'},
                      ],
                      selectedValue: updateDifficulty,
                      selectedItem: selectedDifficulty,
                    ),
                    CustomDropdown(
                      label: 'Priority Level',
                      items: const [
                        {'value': '0', 'label': 'Low'},
                        {'value': '1', 'label': 'Medium'},
                        {'value': '2', 'label': 'High'},
                      ],
                      selectedValue: updatePriority,
                      selectedItem: selectedPriority,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(location),
                    ElevatedButton(
                        onPressed: _openCamera, child: const Text('Camera'))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    image1 == null
                        ? const SizedBox()
                        : SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.file(image1!, fit: BoxFit.cover)),
                    image2 == null
                        ? const SizedBox()
                        : SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.file(image2!, fit: BoxFit.cover))
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SaveButton(
          saveRequirement: () => _saveRequirement(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }
  }
}

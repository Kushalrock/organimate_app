import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import './backend/backend_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/registration_page_controller.dart';
import 'widgets/custom_app_bar.dart';

class RegistrationPagePage extends StatefulWidget {
  const RegistrationPagePage({super.key});

  @override
  State<RegistrationPagePage> createState() => _RegistrationPagePageState();
}

class _RegistrationPagePageState extends State<RegistrationPagePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  final TextEditingController _lastYearProfit = TextEditingController();
  final TextEditingController _lastYearBudget = TextEditingController();
  final TextEditingController _peopleEmployed = TextEditingController();
  final TextEditingController _yieldProduced = TextEditingController();

  final TextEditingController _district = TextEditingController();
  final TextEditingController _state = TextEditingController();

  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BackendService().predictCrop();
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'OTP Verification',
        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "What's the OTP?",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _otpController,
              decoration: InputDecoration(
                hintText: 'OTP',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blueGrey,
                  ),
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () async {
            final resp = await BackendService.verifyOTP(
                _otpController.text, _contactController.text);
            if (resp == true) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("OTP Verified")));

              await register();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Some Error Occured")));
              Navigator.of(context).pop();
            }
            _otpController.clear();
          },
          child: const Text('Submit'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  Future<void> sendOtpStuff() async {
    await register();
    return;
    // final resp = await BackendService.sendOTP(
    //     _nameController.text, _contactController.text);
    // if (resp == true) {
    //   showDialog(
    //       builder: (context) => _buildPopupDialog(context), context: context);
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text("Some Error Occured")));
    // }
  }

  Future<void> register() async {
    final prefs = await SharedPreferences.getInstance();

    if (_contactController.text.length != 10) {
      return;
    }

    await prefs.setString('lastYearProfit', _lastYearProfit.text);
    await prefs.setString('lastYearBudget', _lastYearBudget.text);
    await prefs.setString('lastYearYield', _yieldProduced.text);

    await prefs.setString('peopleEmployed', _peopleEmployed.text);

    await prefs.setString('contact', _contactController.text);
    await prefs.setString('name', _nameController.text);

    await prefs.setString('state', _state.text);
    await prefs.setString('district', _district.text);

    await prefs.setInt('hectaresOfFarmLandOwned',
        _registrationPageController.hectaresOwned.value);

    await prefs.setStringList(
        'fertilisersUsedList',
        _registrationPageController.selectedDropDownFertliserValues
            .cast<String>());
    await prefs.setStringList('cropsGrownList',
        _registrationPageController.selectedDropDownCropValues.cast<String>());
    await prefs.setStringList(
        'pesticidesUsedList',
        _registrationPageController.selectedDropDownPesticidesValues
            .cast<String>());

    Navigator.of(context).pushNamed('/recommendation');
    _registrationPageController.selectedDropDownCropValues.clear();
    _registrationPageController.selectedDropDownFertliserValues.clear();
    _registrationPageController.selectedDropDownPesticidesValues.clear();
  }

  final RegistrationPageController _registrationPageController =
      Get.put(RegistrationPageController());

  List<Widget> getCapsuleWidgets(List<dynamic> listToIterate) {
    List<Widget> capsuleWidgets = [];
    for (int i = 0; i < listToIterate.length; i++) {
      capsuleWidgets.add(
        Container(
          margin: const EdgeInsets.only(
            right: 10.0,
          ),
          child: FilterChip(
            label: Wrap(
              children: [
                Text(
                  listToIterate[i],
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
            labelStyle: const TextStyle(
              color: Colors.white,
            ),
            onSelected: (bool _) {
              listToIterate.remove(listToIterate[i]);
            },
            disabledColor: ourMainColor,
            selectedColor: ourMainColor,
            selected: true,
            showCheckmark: false,
          ),
        ),
      );
    }
    return capsuleWidgets;
  }

  final Color ourMainColor = const Color.fromRGBO(202, 103, 36, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                clipper: CustomAppBar(),
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.green,
                        Colors.lightGreen,
                      ],
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/organimatelogo.png'),
                    width: 200,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Get Started!',
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'In Just 10 minutes',
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blueGrey,
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _contactController,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                          hintText: 'Contact Number',
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '+91',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blueGrey,
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Obx(
                            () => DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueGrey,
                                ),
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: DropdownButton<String>(
                                items:
                                    _registrationPageController.selectTypeDrown,
                                value: _registrationPageController
                                    .selectTypeDownValue.value,
                                elevation: 16,
                                underline: const Text(''),
                                style: const TextStyle(color: Colors.blueGrey),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _registrationPageController
                                        .selectTypeDownValue.value = value;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Obx(
                            () => DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueGrey,
                                ),
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: DropdownButton<String>(
                                items: _registrationPageController
                                    .getCurrentDropDownValues(
                                        _registrationPageController
                                            .selectTypeDownValue.value),
                                value: _registrationPageController
                                    .getCurrentDropDownValue(
                                        _registrationPageController
                                            .selectTypeDownValue.value),
                                elevation: 16,
                                underline: const Text(''),
                                style: const TextStyle(color: Colors.blueGrey),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    if (_registrationPageController
                                            .selectTypeDownValue.value ==
                                        "Fertilisers") {
                                      _registrationPageController
                                          .dropDownFertlisersValue
                                          .value = value;
                                      return;
                                    }
                                    if (_registrationPageController
                                            .selectTypeDownValue.value ==
                                        "Pesticides") {
                                      _registrationPageController
                                          .dropDownPesticidesValue
                                          .value = value;
                                      return;
                                    }
                                    _registrationPageController
                                        .dropDownCropValue.value = value;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (_registrationPageController
                                    .selectTypeDownValue ==
                                "Crops") {
                              if (!_registrationPageController
                                  .selectedDropDownCropValues
                                  .contains(_registrationPageController
                                      .dropDownCropValue.value)) {
                                _registrationPageController
                                    .selectedDropDownCropValues
                                    .add(_registrationPageController
                                        .dropDownCropValue.value);
                              }
                            }
                            if (_registrationPageController
                                    .selectTypeDownValue ==
                                "Pesticides") {
                              if (!_registrationPageController
                                  .selectedDropDownPesticidesValues
                                  .contains(_registrationPageController
                                      .dropDownPesticidesValue.value)) {
                                _registrationPageController
                                    .selectedDropDownPesticidesValues
                                    .add(_registrationPageController
                                        .dropDownPesticidesValue.value);
                              }
                            }
                            if (_registrationPageController
                                    .selectTypeDownValue ==
                                "Fertilisers") {
                              if (!_registrationPageController
                                  .selectedDropDownFertliserValues
                                  .contains(_registrationPageController
                                      .dropDownFertlisersValue.value)) {
                                _registrationPageController
                                    .selectedDropDownFertliserValues
                                    .add(_registrationPageController
                                        .dropDownFertlisersValue.value);
                              }
                            }
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: ourMainColor,
                          ),
                          icon: ClipOval(
                            child: Material(
                              color: ourMainColor,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Obx(
                      () => Column(
                        children: [
                          if (_registrationPageController
                              .selectedDropDownCropValues.isNotEmpty)
                            Text(
                              "Crops",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Wrap(
                            children: getCapsuleWidgets(
                                _registrationPageController
                                    .selectedDropDownCropValues),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Column(
                        children: [
                          if (_registrationPageController
                              .selectedDropDownFertliserValues.isNotEmpty)
                            Text(
                              "Fertilisers",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Wrap(
                            children: getCapsuleWidgets(
                                _registrationPageController
                                    .selectedDropDownFertliserValues),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Column(
                        children: [
                          if (_registrationPageController
                              .selectedDropDownPesticidesValues.isNotEmpty)
                            Text(
                              "Pesticides",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Wrap(
                            children: getCapsuleWidgets(
                                _registrationPageController
                                    .selectedDropDownPesticidesValues),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _lastYearProfit,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Last Year Profit',
                                prefixIconColor: ourMainColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _lastYearBudget,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Last Year Budget',
                                prefixIconColor: ourMainColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _peopleEmployed,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'People Employed',
                                prefixIconColor: ourMainColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _yieldProduced,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Yield (in tons)',
                                prefixIconColor: ourMainColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _state,
                              decoration: InputDecoration(
                                hintText: 'State',
                                prefixIconColor: ourMainColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _district,
                              decoration: InputDecoration(
                                hintText: 'District',
                                prefixIconColor: ourMainColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (_registrationPageController.hectaresOwned <=
                                  0) {
                                return;
                              } else {
                                _registrationPageController.hectaresOwned -= 1;
                              }
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Obx(() => Text(
                              'Hectares of farmland: ${_registrationPageController.hectaresOwned}')),
                          IconButton(
                            onPressed: () {
                              _registrationPageController.hectaresOwned += 1;
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await sendOtpStuff();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ourMainColor,
                      ),
                      child: SizedBox(
                        width: 300,
                        child: Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import './backend/backend_service.dart';
import './controllers/global_stuff_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/recommendation_page_controller.dart';
import 'widgets/custom_app_bar.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  final RecommendationPageController _recommendationPageController =
      Get.put(RecommendationPageController());
  final GlobalStuffController _globalStuffController =
      Get.find<GlobalStuffController>();
  final Color ourMainColor = const Color.fromRGBO(202, 103, 36, 1);
  SharedPreferences? _preferences;
  BackendService backendService = BackendService();

  Future<void> setPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    var listOfFertilisersUsed =
        _preferences?.getStringList('fertilisersUsedList');
    int N = 0;
    int P = 0;
    int K = 0;

    for (var fertiliser in listOfFertilisersUsed!) {
      N += _globalStuffController.fertlisersIngredientValues[fertiliser]!["N"]!;
      P += _globalStuffController.fertlisersIngredientValues[fertiliser]!["P"]!;
      K += _globalStuffController.fertlisersIngredientValues[fertiliser]!["K"]!;
    }

    N = (N ~/ listOfFertilisersUsed.length);
    P = (P ~/ listOfFertilisersUsed.length);
    K = (K ~/ listOfFertilisersUsed.length);

    var result = await backendService.predictCrop(N: N, P: P, K: K);
    _recommendationPageController.selectedFromCropsAvailable[0] =
        _recommendationPageController.cropsAvailable.indexOf(
            result[0][0].toString().substring(0, 1).toUpperCase() +
                result[0][0].toString().substring(1).toLowerCase());
    _recommendationPageController.selectedFromCropsAvailable[1] =
        _recommendationPageController.cropsAvailable.indexOf(
            result[1][0].toString().substring(0, 1).toUpperCase() +
                result[1][0].toString().substring(1).toLowerCase());
    _recommendationPageController.selectedFromCropsAvailable[2] =
        _recommendationPageController.cropsAvailable.indexOf(
            result[2][0].toString().substring(0, 1).toUpperCase() +
                result[2][0].toString().substring(1).toLowerCase());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _recommendationPageController.currentBudget.value =
        _recommendationPageController.maxBudget.value;

    _recommendationPageController.currentPeople.value =
        _recommendationPageController.maxPeople.value;

    _recommendationPageController.changePercentageArray();
  }

  final List<List<String>> _matchingAndPotentialStrings = [
    ["Groundnuts", "Soybean", "Turmeric"],
    ["Groundnuts", "Sorghum", "Soybean"],
    ["Maize", "Mustard", "Sugarcane"],
    ["Cotton", "Sugarcane"],
    ["Groundnuts", "Soybean"],
    ["Cashew", "Rubber"],
    ["Pears", "Walnuts"],
    ["Soybean", "Groundnuts"],
    ["Cucumber", "Tomatoes"],
    ["Blackbeans", "Kabulichana"],
    ["Pineapple", "Mango", "Banana"],
    ["Almonds", "Grapes"],
    ["Kabulichana", "Soybean"],
    ["Mungbeans", "Soybean"],
    ["Mungbeans", "Soybean"],
    ["Lemons", "Grapes"],
    [
      "Blueberries",
      "Kiwis",
      "Figs",
      "Raspberries",
      "Strawberries",
      "Blackberries"
    ],
    ["Banana", "Pineapple"],
    ["Papaya", "Pineapple"],
    ["Lentils", "Soybean"],
    ["Watermelon", "Cucumber"],
    ["Papaya", "Mango", "Pineapple", "Coconut"]
  ];

  List<Widget> getMatchingCrops(int selectedCrop, var funToRun) {
    List<Widget> matchingCrops = [];
    for (int i = 0;
        i < _matchingAndPotentialStrings[selectedCrop].length;
        i++) {
      matchingCrops.add(Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: InkWell(
          onTap: () {
            funToRun.value = _matchingAndPotentialStrings[selectedCrop][i];
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: funToRun.value ==
                            _matchingAndPotentialStrings[selectedCrop][i]
                        ? 5
                        : 0,
                    color: ourMainColor,
                  ),
                  borderRadius: BorderRadius.circular(100), //<-- SEE HERE
                ),
                child: Image(
                  image: AssetImage(
                      'assets/images/${_matchingAndPotentialStrings[selectedCrop][i].toLowerCase()}.png'),
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _matchingAndPotentialStrings[selectedCrop][i],
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return matchingCrops;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: FutureBuilder(
            future: setPreferences(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
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
                            image:
                                AssetImage('assets/images/organimatelogo.png'),
                            width: 200,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Namaste, ${_preferences?.getString('name')}!',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Let\'s select a suitable crop:',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromRGBO(246, 196, 146, 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Obx(
                                () => Text(
                                  'Your Budget(pHA): ${_recommendationPageController.currentBudget.value}',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Slider(
                                  min: _recommendationPageController
                                      .minBudget.value
                                      .toDouble(),
                                  max: _recommendationPageController
                                      .maxBudget.value
                                      .toDouble(),
                                  value: _recommendationPageController
                                      .currentBudget.value
                                      .toDouble(),
                                  onChanged: (value) {
                                    _recommendationPageController
                                        .currentBudget.value = value.toInt();
                                    _recommendationPageController
                                        .changePercentageArray();
                                    _recommendationPageController
                                        .getHighestPercentageSelectedCrop();
                                  },
                                  divisions: (_recommendationPageController
                                              .maxBudget.value -
                                          _recommendationPageController
                                              .minBudget.value) ~/
                                      1000,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromRGBO(246, 196, 146, 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Obx(
                                () => Text(
                                  'Employment Capacity: ${_recommendationPageController.currentPeople.value}',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Slider(
                                  min: _recommendationPageController
                                      .minPeople.value
                                      .toDouble(),
                                  max: _recommendationPageController
                                      .maxPeople.value
                                      .toDouble(),
                                  value: _recommendationPageController
                                      .currentPeople.value
                                      .toDouble(),
                                  onChanged: (value) {
                                    _recommendationPageController
                                        .currentPeople.value = value.toInt();
                                    _recommendationPageController
                                        .changePercentageArray();
                                    _recommendationPageController
                                        .getHighestPercentageSelectedCrop();
                                  },
                                  divisions: ((_recommendationPageController
                                              .maxPeople.value -
                                          _recommendationPageController
                                              .minPeople.value))
                                      .toInt(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Potential Crops:',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: InkWell(
                                onTap: () {
                                  _recommendationPageController.selectedCrop
                                      .value = _recommendationPageController
                                          .cropsAvailable[
                                      _recommendationPageController
                                          .selectedFromCropsAvailable[0]];
                                  _recommendationPageController
                                          .cropSelected.value =
                                      _recommendationPageController
                                          .selectedFromCropsAvailable[0];
                                  _recommendationPageController.selected.value =
                                      true;

                                  _recommendationPageController.currentBudget
                                      .value = _recommendationPageController
                                          .cropsAndBudget[
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[0]]]!;

                                  _recommendationPageController.currentPeople
                                      .value = _recommendationPageController
                                          .cropsAndPeople[
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[0]]]!;
                                  _recommendationPageController
                                      .changePercentageArray();
                                },
                                child: Column(
                                  children: [
                                    Obx(
                                      () => Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: _recommendationPageController
                                                      .getIfToShowImageBorderOrNot(
                                                          _recommendationPageController
                                                              .selectedFromCropsAvailable[0])
                                                  ? 5
                                                  : 0,
                                              color: ourMainColor),
                                          borderRadius: BorderRadius.circular(
                                              100), //<-- SEE HERE
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/${_recommendationPageController.cropsAvailable[_recommendationPageController.selectedFromCropsAvailable[0]].toLowerCase()}.png'),
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[0]],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        "Match: ${_recommendationPageController.percentageArray[_recommendationPageController.selectedFromCropsAvailable[0]].toPrecision(2)} %",
                                        style: GoogleFonts.montserrat(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: InkWell(
                                onTap: () {
                                  _recommendationPageController.selectedCrop
                                      .value = _recommendationPageController
                                          .cropsAvailable[
                                      _recommendationPageController
                                          .selectedFromCropsAvailable[1]];
                                  _recommendationPageController
                                          .cropSelected.value =
                                      _recommendationPageController
                                          .selectedFromCropsAvailable[1];
                                  _recommendationPageController.selected.value =
                                      true;

                                  _recommendationPageController.currentBudget
                                      .value = _recommendationPageController
                                          .cropsAndBudget[
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[1]]]!;

                                  _recommendationPageController.currentPeople
                                      .value = _recommendationPageController
                                          .cropsAndPeople[
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[1]]]!;
                                  _recommendationPageController
                                      .changePercentageArray();
                                },
                                child: Column(
                                  children: [
                                    Obx(
                                      () => Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: _recommendationPageController
                                                      .getIfToShowImageBorderOrNot(
                                                          _recommendationPageController
                                                              .selectedFromCropsAvailable[1])
                                                  ? 5
                                                  : 0,
                                              color: ourMainColor),
                                          borderRadius: BorderRadius.circular(
                                              100), //<-- SEE HERE
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/${_recommendationPageController.cropsAvailable[_recommendationPageController.selectedFromCropsAvailable[1]].toLowerCase()}.png'),
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[1]],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        "Match: ${_recommendationPageController.percentageArray[_recommendationPageController.selectedFromCropsAvailable[1]].toPrecision(2)} %",
                                        style: GoogleFonts.montserrat(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: InkWell(
                                onTap: () {
                                  _recommendationPageController.selectedCrop
                                      .value = _recommendationPageController
                                          .cropsAvailable[
                                      _recommendationPageController
                                          .selectedFromCropsAvailable[2]];
                                  _recommendationPageController
                                          .cropSelected.value =
                                      _recommendationPageController
                                          .selectedFromCropsAvailable[2];
                                  _recommendationPageController.selected.value =
                                      true;

                                  _recommendationPageController.currentBudget
                                      .value = _recommendationPageController
                                          .cropsAndBudget[
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[2]]]!;

                                  _recommendationPageController.currentPeople
                                      .value = _recommendationPageController
                                          .cropsAndPeople[
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[2]]]!;

                                  _recommendationPageController
                                      .changePercentageArray();
                                },
                                child: Column(
                                  children: [
                                    Obx(
                                      () => Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: _recommendationPageController
                                                    .getIfToShowImageBorderOrNot(
                                                        _recommendationPageController
                                                            .selectedFromCropsAvailable[2])
                                                ? 5
                                                : 0,
                                            color: ourMainColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              100), //<-- SEE HERE
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/${_recommendationPageController.cropsAvailable[_recommendationPageController.selectedFromCropsAvailable[2]].toLowerCase()}.png'),
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      _recommendationPageController
                                              .cropsAvailable[
                                          _recommendationPageController
                                              .selectedFromCropsAvailable[2]],
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        "Match: ${_recommendationPageController.percentageArray[_recommendationPageController.selectedFromCropsAvailable[2]].toPrecision(2)} %",
                                        style: GoogleFonts.montserrat(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Matching Crops:',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: getMatchingCrops(
                              _recommendationPageController.cropSelected.value,
                              _recommendationPageController
                                  .selectedOrganicCrop),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromRGBO(246, 196, 146, 0.5),
                            ),
                            height: 160,
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/images/money_bag.png'),
                                  height: 100,
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      _recommendationPageController
                                          .getCurrentBudgetText(
                                              _recommendationPageController
                                                  .selectedCrop.value,
                                              multiplyQuotient: _preferences!
                                                  .getInt(
                                                      "hectaresOfFarmLandOwned")!),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromRGBO(246, 196, 146, 0.5),
                            ),
                            height: 160,
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/farm_labourer.png'),
                                  height: 100,
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      _recommendationPageController
                                          .getCurrentLabourText(
                                              _recommendationPageController
                                                  .selectedCrop.value),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Timeline:',
                              style: GoogleFonts.montserrat(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromRGBO(246, 196, 146, 0.5),
                            ),
                            height: 160,
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/images/tile001.png'),
                                  height: 60,
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.preSeedingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]}',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.rainfallpreSeedingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]} cm',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.temppreSeedingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]} C',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromRGBO(246, 196, 146, 0.5),
                            ),
                            height: 160,
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/images/tile002.png'),
                                  height: 60,
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.sowingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]}',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.rainfallsowingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]} cm',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.tempsowingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]} C',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromRGBO(246, 196, 146, 0.5),
                            ),
                            height: 160,
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/images/tile005.png'),
                                  height: 60,
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.manurePeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]}',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.rainfallmanurePeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]} cm',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.tempmanurePeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]} C',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromRGBO(246, 196, 146, 0.5),
                            ),
                            height: 160,
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/images/tile006.png'),
                                  height: 60,
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.reapingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]}',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.rainfallreapingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]} cm',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${_recommendationPageController.tempreapingPeriodOfCrops[_recommendationPageController.cropsAvailable[_recommendationPageController.cropSelected.value]]} C',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Obx(
                        () => ElevatedButton(
                          onPressed:
                              _recommendationPageController.selected.value &&
                                      _recommendationPageController
                                          .selectedOrganicCrop.value.isNotEmpty
                                  ? () async {
                                      await _preferences?.setString(
                                          "conventionalCropText",
                                          _recommendationPageController
                                                  .cropsAvailable[
                                              _recommendationPageController
                                                  .cropSelected.value]);
                                      await _preferences?.setString(
                                          "organicCropText",
                                          _recommendationPageController
                                              .selectedOrganicCrop.value);
                                      await _preferences?.setInt(
                                        "organicCropBudget",
                                        _recommendationPageController
                                            .getCropBudgetToSave(
                                                organic: true,
                                                multiplyQuotient: _preferences!
                                                    .getInt(
                                                        "hectaresOfFarmLandOwned")!),
                                      );

                                      await _preferences?.setInt(
                                        "inorganicCropBudget",
                                        _recommendationPageController
                                            .getCropBudgetToSave(
                                                organic: false,
                                                multiplyQuotient: _preferences!
                                                    .getInt(
                                                        "hectaresOfFarmLandOwned")!),
                                      );
                                      Navigator.of(context)
                                          .pushReplacementNamed('/home');
                                    }
                                  : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ourMainColor,
                          ),
                          child: SizedBox(
                            width: 360,
                            child: Center(
                                child: Text(
                              'Create Plan',
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
      floatingActionButton: Obx(() => _recommendationPageController
                  .selectedCrop.isNotEmpty &&
              _recommendationPageController.selectedOrganicCrop.value.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                _recommendationPageController.selectedCrop.value = "";
                _recommendationPageController.cropSelected.value = 0;
                _recommendationPageController.selected.value = false;
              },
              child: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
            )
          : const SizedBox()),
    );
  }
}

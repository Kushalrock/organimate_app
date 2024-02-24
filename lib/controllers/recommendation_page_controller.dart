import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationPageController extends GetxController {
  var selectedCrop = "".obs;
  var maxBudget = 680000.obs;
  var minBudget = 22500.obs;

  var cropSelected = 0.obs;
  var selected = false.obs;
  var cropsAvailable = [
    "Cotton",
    "Maize",
    "Rice",
    "Jute",
    "Pigeonpeas",
    "Coconut",
    "Apple",
    "Mungbean",
    "Watermelon",
    "Kidneybeans",
    "Papaya",
    "Pomegranate",
    "Lentil",
    "Blackgram",
    "Mothbeans",
    "Orange",
    "Grapes",
    "Coffee",
    "Mango",
    "Chickpea",
    "Muskmelon",
    "Banana"
  ];

  var selectedFromCropsAvailable = [0, 1, 2];

  var selectedOrganicCrop = "".obs;

  var currentBudget = 500000.obs;
  var currentPeople = 50.obs;

  var percentageArray = [
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
    50.0
  ].obs;

  changePercentageArray() {
    var optimumBudgetArray = cropsAndBudget.values.toList();
    var optimumPeopleArray = cropsAndPeople.values.toList();
    List<double> percentageList = [];
    for (var op in optimumBudgetArray) {
      var tempDiff = op - currentBudget.value;
      var temp = -0.0002 * tempDiff.abs() + 48;
      percentageList.add(temp.abs().toPrecision(2));
    }

    for (int i = 0; i < optimumPeopleArray.length; i++) {
      var tempDiff = optimumPeopleArray[i] - currentPeople.value;
      var temp = -tempDiff.abs() + 48;
      percentageList[i] += temp.abs();
      if (percentageList[i] > 96) {
        percentageList[i] = 96;
      }
    }

    for (int i = 0; i < percentageList.length; i++) {
      percentageArray[i] = percentageList[i];
    }
  }

  bool getIfToShowImageBorderOrNot(int toCheck) {
    if (cropSelected.value == toCheck && selected.value == true) {
      print("Yes");
      return true;
    }
    return false;
  }

  getHighestPercentageSelectedCrop() {
    int temp = selectedFromCropsAvailable[0];
    for (int i = 1; i < 3; i++) {
      if (percentageArray[selectedFromCropsAvailable[i]] >
          percentageArray[temp]) {
        temp = selectedFromCropsAvailable[i];
      }
    }

    cropSelected.value = temp;
    selected.value = true;
    selectedCrop.value = cropsAvailable[cropSelected.value];
  }

  Widget getDescriptionPage(int cropSelected) {
    List<Widget> toReturn = [];

    if (!selected.value) {
      return const SizedBox();
    } else {
      toReturn.add(
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Timeline:',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      );
      toReturn.add(
        const SizedBox(
          height: 20,
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Pre-Seeding: ${preSeedingPeriodOfCrops[cropsAvailable[cropSelected]]}'),
              Row(
                children: [
                  const Icon(Icons.cloud),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${rainfallpreSeedingPeriodOfCrops[cropsAvailable[cropSelected]]} cm'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.sunny),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${temppreSeedingPeriodOfCrops[cropsAvailable[cropSelected]]} C'),
                ],
              )
            ],
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Sowing: ${sowingPeriodOfCrops[cropsAvailable[cropSelected]]}'),
              Row(
                children: [
                  const Icon(Icons.cloud),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${rainfallsowingPeriodOfCrops[cropsAvailable[cropSelected]]} cm'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.sunny),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${tempsowingPeriodOfCrops[cropsAvailable[cropSelected]]} C'),
                ],
              )
            ],
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Manure: ${manurePeriodOfCrops[cropsAvailable[cropSelected]]}'),
              Row(
                children: [
                  const Icon(Icons.cloud),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${rainfallmanurePeriodOfCrops[cropsAvailable[cropSelected]]} cm'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.sunny),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${tempmanurePeriodOfCrops[cropsAvailable[cropSelected]]} C'),
                ],
              )
            ],
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Reaping: ${reapingPeriodOfCrops[cropsAvailable[cropSelected]]}'),
              Row(
                children: [
                  const Icon(Icons.cloud),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${rainfallreapingPeriodOfCrops[cropsAvailable[cropSelected]]} cm'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.sunny),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${tempreapingPeriodOfCrops[cropsAvailable[cropSelected]]} C'),
                ],
              )
            ],
          ),
        ),
      );

      return Column(
        children: toReturn,
      );
    }
  }

  Map<String, int> cropsAndBudget = {
    "Cotton": 168000,
    "Maize": 350000,
    "Rice": 680000,
    "Jute": 49000,
    "Pigeonpeas": 26000,
    "Coconut": 160000,
    "Apple": 350000,
    "Mungbean": 27170,
    "Watermelon": 123500,
    "Kidneybeans": 74100,
    "Papaya": 191415,
    "Pomegranate": 432250,
    "Lentil": 37050,
    "Blackgram": 33345,
    "Mothbeans": 22500,
    "Orange": 185302,
    "Grapes": 494000,
    "Coffee": 175000,
    "Mango": 187500,
    "Chickpea": 52488,
    "Muskmelon": 69160,
    "Banana": 249470
  };

  Map<String, String> sowingPeriodOfCrops = {
    "Cotton": "Apr-May",
    "Maize": "Apr-May",
    "Rice": "Jun-Jul",
    "Jute": "May-Jun",
    "Pigeonpeas": "Jun-Jul",
    "Coconut": "Jul-Aug",
    "Apple": "Dec-Feb",
    "Mungbean": "Apr-May",
    "Watermelon": "Mar-Apr",
    "Kidneybeans": "Apr-May",
    "Papaya": "Apr-May",
    "Pomegranate": "Apr-May",
    "Lentil": "Nov-Dec",
    "Blackgram": "Apr-May",
    "Mothbeans": "Apr-May",
    "Orange": "Jun-Jul",
    "Grapes": "Dec-Jan",
    "Coffee": "Jun-Jul",
    "Mango": "Dec-Jan",
    "Chickpea": "Nov-Dec",
    "Muskmelon": "Mar-Apr",
    "Banana": "Apr-Jun"
  };
  // Apr-May

  Map<String, String> reapingPeriodOfCrops = {
    "Cotton": "Oct-Nov",
    "Maize": "Sep-Nov",
    "Rice": "Sep-Oct",
    "Jute": "Sep-Oct",
    "Pigeonpeas": "Dec-Jan",
    "Coconut": "Nov-Dec",
    "Apple": "Sep-Nov",
    "Mungbean": "Oct-Nov",
    "Watermelon": "Aug-Sep",
    "Kidneybeans": "Oct-Nov",
    "Papaya": "Sep-Oct",
    "Pomegranate": "Oct-Nov",
    "Lentil": "Apr-May",
    "Blackgram": "Sep-Oct",
    "Mothbeans": "Sep-Oct",
    "Orange": "Jan-Mar",
    "Grapes": "Jan-Feb",
    "Coffee": "Dec-Feb",
    "Mango": "May-Aug",
    "Chickpea": "Mar-Apr",
    "Muskmelon": "Aug-Sep",
    "Banana": "Feb-Apr"
  };
  // Sep-Oct

  Map<String, String> preSeedingPeriodOfCrops = {
    "Cotton": "Mar-Apr",
    "Maize": "Mar-Apr",
    "Rice": "May-Jun",
    "Jute": "Mar-Apr",
    "Pigeonpeas": "Apr-May",
    "Coconut": "May-Jun",
    "Apple": "Feb-Mar",
    "Mungbean": "Feb-Mar",
    "Watermelon": "Feb-Mar",
    "Kidneybeans": "Feb-Mar",
    "Papaya": "Feb-Mar",
    "Pomegranate": "Feb-Mar",
    "Lentil": "Oct-Nov",
    "Blackgram": "Mar-Apr",
    "Mothbeans": "Mar-Apr",
    "Orange": "Nov-Dec",
    "Grapes": "Oct-Nov",
    "Coffee": "May-Jun",
    "Mango": "Oct-Nov",
    "Chickpea": "Oct-Nov",
    "Muskmelon": "Feb-Mar",
    "Banana": "Mar-Apr"
  };
  // Feb-Mar

  Map<String, String> manurePeriodOfCrops = {
    "Cotton": "Mar-April",
    "Maize": "Mar-April",
    "Rice": "May",
    "Jute": "May-Jun",
    "Pigeonpeas": "Aug-Sep",
    "Coconut": "Sep-Oct",
    "Apple": "Mar-Apr",
    "Mungbean": "Jul-Aug",
    "Watermelon": "Jun-Jul",
    "Kidneybeans": "Jul-Aug",
    "Papaya": "May-Jun",
    "Pomegranate": "May-Jun",
    "Lentil": "Dec-Jan",
    "Blackgram": "May-Jun",
    "Mothbeans": "May-Jun",
    "Orange": "Oct-Nov",
    "Grapes": "Nov-Dec",
    "Coffee": "Jan-Feb",
    "Mango": "Mar-Apr",
    "Chickpea": "Jan-Feb",
    "Muskmelon": "May-Jun",
    "Banana": "Jul-Aug"
  };
  // May-Jun

  Map<String, String> tempsowingPeriodOfCrops = {
    "Cotton": "15-35",
    "Maize": "25-30",
    "Rice": "25-35",
    "Jute": "23-27",
    "Pigeonpeas": "26-31",
    "Coconut": "25-32",
    "Apple": "24-33",
    "Mungbean": "21-26",
    "Watermelon": "25-28",
    "Kidneybeans": "29-35",
    "Papaya": "26-32",
    "Pomegranate": "24-30",
    "Lentil": "29-34",
    "Blackgram": "30-35",
    "Mothbeans": "23-28",
    "Orange": "20-24",
    "Grapes": "18-22",
    "Coffee": "16-22",
    "Mango": "29-35",
    "Chickpea": "27-32",
    "Muskmelon": "21-29",
    "Banana": "25-31",
  };

  Map<String, String> tempreapingPeriodOfCrops = {
    "Cotton": "23-29",
    "Maize": "21-27",
    "Rice": "33",
    "Jute": "20-25",
    "Pigeonpeas": "25-30",
    "Coconut": "20-30",
    "Apple": "13-24",
    "Mungbean": "25-35",
    "Watermelon": "18-35",
    "Kidneybeans": "20-25",
    "Papaya": "20-33",
    "Pomegranate": "18-25",
    "Lentil": "15-25",
    "Blackgram": "25-35",
    "Mothbeans": "25-30",
    "Orange": "15-35",
    "Grapes": "15-35",
    "Coffee": "20-30",
    "Mango": "24-27",
    "Chickpea": "18-30",
    "Muskmelon": "25-30",
    "Banana": "20-30"
  };

  Map<String, String> temppreSeedingPeriodOfCrops = {
    "Cotton": "15-35",
    "Maize": "25-30",
    "Rice": "25-30",
    "Jute": "25-30",
    "Pigeonpeas": "25-30",
    "Coconut": "28-34",
    "Apple": "15-24",
    "Mungbean": "30-35",
    "Watermelon": "24-32",
    "Kidneybeans": "25-30",
    "Papaya": "22-30",
    "Pomegranate": "15-35",
    "Lentil": "20-25",
    "Blackgram": "25-30",
    "Mothbeans": "25-30",
    "Orange": "15-35",
    "Grapes": "15-20",
    "Coffee": "25-30",
    "Mango": "24-27",
    "Chickpea": "25-30",
    "Muskmelon": "20-25",
    "Banana": "24-27"
  };

  Map<String, String> tempmanurePeriodOfCrops = {
    "Cotton": "15-35",
    "Maize": "23-43",
    "Rice": "25-30",
    "Jute": "28-32",
    "Pigeonpeas": "27-32",
    "Coconut": "30-36",
    "Apple": "18-26",
    "Mungbean": "32-38",
    "Watermelon": "26-34",
    "Kidneybeans": "27-32",
    "Papaya": "24-32",
    "Pomegranate": "17-37",
    "Lentil": "22-27",
    "Blackgram": "27-32",
    "Mothbeans": "27-32",
    "Orange": "17-37",
    "Grapes": "16-22",
    "Coffee": "27-32",
    "Mango": "26-29",
    "Chickpea": "27-32",
    "Muskmelon": "22-27",
    "Banana": "26-29"
  };

  Map<String, String> rainfallsowingPeriodOfCrops = {
    "Cotton": "15.9-16.5",
    "Maize": "15.9-16.5",
    "Rice": "10-150",
    "Jute": "150-250",
    "Pigeonpeas": "50-100",
    "Coconut": "0-10",
    "Apple": "50-100",
    "Mungbean": "50-100",
    "Watermelon": "200-300",
    "Kidneybeans": "50-100",
    "Papaya": "200-300",
    "Pomegranate": "0-10",
    "Lentil": "50-100",
    "Blackgram": "50-100",
    "Mothbeans": "50-100",
    "Orange": "0-10",
    "Grapes": "50-100",
    "Coffee": "100-200",
    "Mango": "50-100",
    "Chickpea": "50-100",
    "Muskmelon": "200-300",
    "Banana": "200-300"
  };

  Map<String, String> rainfallreapingPeriodOfCrops = {
    "Cotton": "4.9-7",
    "Maize": "6-82.3",
    "Rice": "4.9-82.3",
    "Jute": "1200-1800",
    "Pigeonpeas": "800-1200",
    "Coconut": "1000-2000",
    "Apple": "1000-1500",
    "Mungbean": "600-800",
    "Watermelon": "400-600",
    "Kidneybeans": "600-800",
    "Papaya": "800-1200",
    "Pomegranate": "200-400",
    "Lentil": "600-800",
    "Blackgram": "600-800",
    "Mothbeans": "600-800",
    "Orange": "400-600",
    "Grapes": "600-800",
    "Coffee": "1500-2500",
    "Mango": "800-1200",
    "Chickpea": "600-800",
    "Muskmelon": "400-600",
    "Banana": "1200-1800"
  };

  Map<String, String> rainfallpreSeedingPeriodOfCrops = {
    "Cotton": "15.9-26.2",
    "Maize": "15.9-26.2",
    "Rice": "25-30",
    "Jute": "10-15",
    "Pigeonpeas": "20-30",
    "Coconut": "0-10",
    "Apple": "50-100",
    "Mungbean": "5-10",
    "Watermelon": "0-5",
    "Kidneybeans": "20-30",
    "Papaya": "20-30",
    "Pomegranate": "0-5",
    "Lentil": "20-30",
    "Blackgram": "5-10",
    "Mothbeans": "5-10",
    "Orange": "0-5",
    "Grapes": "0-5",
    "Coffee": "0-5",
    "Mango": "0-5",
    "Chickpea": "20-30",
    "Muskmelon": "0-5",
    "Banana": "20-30"
  };

  Map<String, String> rainfallmanurePeriodOfCrops = {
    "Cotton": "26.2-15.9",
    "Maize": "26.2-15.9",
    "Rice": "16.5",
    "Jute": "150-250",
    "Pigeonpeas": "50-100",
    "Coconut": "0-10",
    "Apple": "50-100",
    "Mungbean": "50-100",
    "Watermelon": "200-300",
    "Kidneybeans": "50-100",
    "Papaya": "200-300",
    "Pomegranate": "0-10",
    "Lentil": "50-100",
    "Blackgram": "50-100",
    "Mothbeans": "50-100",
    "Orange": "0-10",
    "Grapes": "50-100",
    "Coffee": "100-200",
    "Mango": "50-100",
    "Chickpea": "50-100",
    "Muskmelon": "200-300",
    "Banana": "200-300"
  };

  String getCurrentBudgetText(String selectedCrop, {int multiplyQuotient = 1}) {
    if (selectedCrop.isNotEmpty) {
      int budgetToDisplay = cropsAndBudget[selectedCrop]! * multiplyQuotient;
      return "₹$budgetToDisplay";
    }
    return "₹$minBudget - ₹$maxBudget";
  }

  int getCropBudgetToSave({bool organic = false, int multiplyQuotient = 1}) {
    if (organic) {
      return (0.37 * cropsAndBudget[selectedCrop.value]! * multiplyQuotient)
          .toInt();
    }
    return (0.63 * cropsAndBudget[selectedCrop.value]! * multiplyQuotient)
        .toInt();
  }

  var maxPeople = 120.obs;
  var minPeople = 23.obs;
  Map<String, int> cropsAndPeople = {
    "Cotton": 70,
    "Maize": 80,
    "Rice": 60,
    "Jute": 42,
    "Pigeonpeas": 33,
    "Coconut": 45,
    "Apple": 23,
    "Mungbean": 84,
    "Watermelon": 78,
    "Kidneybeans": 87,
    "Papaya": 57,
    "Pomegranate": 54,
    "Lentil": 67,
    "Blackgram": 45,
    "Mothbeans": 77,
    "Orange": 77,
    "Grapes": 113,
    "Coffee": 81,
    "Mango": 60,
    "Chickpea": 72,
    "Muskmelon": 90,
    "Banana": 92,
  };
  String getCurrentLabourText(String selectedCrop) {
    if (selectedCrop.isNotEmpty) {
      return "${cropsAndPeople[selectedCrop]}";
    }
    return "$minPeople - $maxPeople";
  }
}

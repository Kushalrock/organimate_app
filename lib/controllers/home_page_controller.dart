import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  var selectedOrganic = true.obs;

  var firstDabbaTitle = "Profits(Est.)".obs;
  var firstDabbaText = "₹-50000".obs;

  var secondDabbaTitle = "Ends By".obs;
  var secondDabbaText = "June 2024".obs;

  var thirdDabbaTitle = "Land Resv.".obs;
  var thirdDabbaText = "2 (h.a)".obs;

  var fourthDabbaTitle = "Budget".obs;
  var fourthDabbaText = "₹600000".obs;

  var fifthDabbaTitle = "Yield".obs;
  var fifthDabbaText = "100 tons".obs;

  var sixthDabbaTitle = "Market Price".obs;
  var sixthDabbaText = "₹122 (KG)".obs;

  var conventionalCropText = "".obs;
  var organicCropText = "".obs;

  var newThirdDabbaText = 18;

  var newFourthDabbaTextOrganic = 1500000;
  var newFourthDabbaTextInorganic = 600000;

  initControlStuff() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    conventionalCropText.value =
        sharedPreferences.getString('conventionalCropText')!;
    organicCropText.value = sharedPreferences.getString('organicCropText')!;
    newThirdDabbaText = sharedPreferences.getInt("hectaresOfFarmLandOwned")!;
    newFourthDabbaTextOrganic = sharedPreferences.getInt("organicCropBudget")!;
    newFourthDabbaTextInorganic =
        sharedPreferences.getInt("inorganicCropBudget")!;
    changeText();
  }

  changeText() {
    if (!selectedOrganic.value) {
      firstDabbaText.value = "₹700000";
      secondDabbaText.value = "October 2023";
      thirdDabbaText.value =
          "${newThirdDabbaText - (newThirdDabbaText * 0.17).toPrecision(2)} (h.a)";
      fourthDabbaText.value = "₹$newFourthDabbaTextInorganic";
      fifthDabbaText.value = "500 tons";
      sixthDabbaText.value = "₹40 (KG)";
    } else {
      firstDabbaText.value = "₹-50000";
      secondDabbaText.value = "June 2024";
      thirdDabbaText.value =
          "${(newThirdDabbaText * 0.17).toPrecision(2)} (h.a)";
      fourthDabbaText.value = "₹$newFourthDabbaTextOrganic";
      fifthDabbaText.value = "100 tons";
      sixthDabbaText.value = "₹122 (KG)";
    }
  }
}

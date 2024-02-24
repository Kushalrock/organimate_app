import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPageController extends GetxController {
  var dropDownCropValue = "Rice".obs;
  var dropDownFertlisersValue = "Biola".obs;
  var dropDownPesticidesValue = "Aceveer".obs;
  var selectTypeDownValue = "Crops".obs;
  var selectedDropDownCropValues = [].obs;
  var selectedDropDownFertliserValues = [].obs;
  var selectedDropDownPesticidesValues = [].obs;

  var hectaresOwned = 0.obs;

  List<DropdownMenuItem<String>> getCurrentDropDownValues(
      String selectTypeDownValue) {
    if (selectTypeDownValue == "Crops") {
      return cropDropDownValues;
    } else if (selectTypeDownValue == "Pesticides") {
      return pesticidesDropDownValues;
    }
    return fertilisersDropDownValues;
  }

  String getCurrentDropDownValue(String selectTypeDownValue) {
    if (selectTypeDownValue == "Crops") {
      return dropDownCropValue.value;
    } else if (selectTypeDownValue == "Pesticides") {
      return dropDownPesticidesValue.value;
    }
    return dropDownFertlisersValue.value;
  }

  var pesticidesDropDownValues = [
    const DropdownMenuItem(
      value: "Aceveer",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Aceveer",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Aceveer.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Astra",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Astra",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Astra.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Finio",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Finio",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Finio.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Foster",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Foster",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Foster.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Matsuri",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Matsuri",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Matsuri.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Mortar",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mortar",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Mortar.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Mythri",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mythri",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Mythri.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Sargent",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sargent",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Sargent.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Shinwa",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shinwa",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Shinwa.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Tadaaki",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tadaaki",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Tadaaki.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "UdaanP",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "UdaanP",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/UdaanP.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "UEPA",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "UEPA",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/UEPA.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Veertap",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Veertap",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Veertap.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
  ];
  var fertilisersDropDownValues = [
    const DropdownMenuItem(
      value: "Biola",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Biola',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Biola.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Gromor",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gromor",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Gromor.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Groshakti",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Groshakti",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Groshakti.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "MASF",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "MASF",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/MASF.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Microla",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Microla",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Microla.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "MMOP",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "MMOP",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/MMOP.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "MSSP",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "MSSP",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/MSSP.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "NarmadaPhos",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Narmada",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/NarmadaPhos.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "NeemUrea",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NeemUrea",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/NeemUrea.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Paramfos",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Paramfos",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Paramfos.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Sujala",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sujala",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/Sujala.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "UNU",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "UNU",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/UNU.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "UttamDAP",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "UttamDAP",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/UttamDAP.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "UttamMOP",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "UttamMOP",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/UttamMOP.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  var selectTypeDrown = [
    const DropdownMenuItem(
      value: "Crops",
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Crops",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Pesticides",
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pesticides",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Fertilisers",
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fertilisers",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    )
  ];
  var cropDropDownValues = [
    const DropdownMenuItem(
      value: "Arhaar",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Arhaar",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/arhaar.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Bajra",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bajra",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/bajra.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Chana",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chana",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/chana.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Cotton",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cotton",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/cotton.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Cucumber",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cucumber",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/cucumber.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "KabuliChana",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "KabuliChana",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/kabulichana.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Maize",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Maize",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/maize.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Masoor",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Masoor",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/masoor.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Mustard",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mustard",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/mustard.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Okra",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Okra",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/okra.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Onion",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Onion",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/onion.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Potato",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Potato",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/potato.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Ragi",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ragi",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/ragi.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Rice",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rice",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/rice.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Soybean",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Soybean",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/soybean.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "Tea",
      child: SizedBox(
        width: 155,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tea",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image(
                image: AssetImage('assets/images/tea.png'),
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ),
    // DropdownMenuItem(
    //   child: Container(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             "Wheat",
    //             style: TextStyle(
    //               fontSize: 18,
    //             ),
    //           ),
    //           SizedBox(
    //             width: 3,
    //           ),
    //           Image(
    //             image: AssetImage('assets/images/wheat.png'),
    //             width: 30,
    //             height: 30,
    //           ),
    //         ],
    //       ),
    //     ),
    //     width: 155,
    //   ),
    //   value: "Wheat",
    // ),
  ];
}

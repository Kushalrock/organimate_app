import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/global_stuff_controller.dart';
import './controllers/home_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/custom_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color ourMainColor = const Color.fromRGBO(246, 161, 146, 1);

  final Color secondary = const Color.fromRGBO(15, 99, 11, 1);

  final GlobalStuffController _globalStuffController =
      Get.find<GlobalStuffController>();

  final HomePageController _homePageController = Get.put(HomePageController());

  void _onItemTapped(int index, BuildContext context) {
    _globalStuffController.selectedPage.value = index;
    switch (index) {
      case 1:
        Navigator.of(context).pushReplacementNamed('/marketplace');
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed('/profile');
        break;
      default:
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homePageController.initControlStuff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              const Image(
                image: AssetImage('assets/images/piChart.png'),
                width: 300,
                height: 400,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Net Profit:',
                      style: GoogleFonts.montserrat(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₹650000',
                      style: GoogleFonts.montserrat(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Net Budget:',
                      style: GoogleFonts.montserrat(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₹2100000',
                      style: GoogleFonts.montserrat(),
                    )
                  ],
                ),
              ),
              Text(
                'Selected Plan'.toUpperCase(),
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {
                        _homePageController.selectedOrganic.value = false;
                        _homePageController.changeText();
                      },
                      child: Column(
                        children: [
                          Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width:
                                      _homePageController.selectedOrganic.value
                                          ? 0
                                          : 5,
                                  color: ourMainColor,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/${_homePageController.conventionalCropText.value.toLowerCase()}.png'),
                                width: 100,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => Text(
                                _homePageController.conventionalCropText.value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {
                        _homePageController.selectedOrganic.value = true;
                        _homePageController.changeText();
                      },
                      child: Column(
                        children: [
                          Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width:
                                      _homePageController.selectedOrganic.value
                                          ? 5
                                          : 0,
                                  color: ourMainColor,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/${_homePageController.organicCropText.value.toLowerCase()}.png'),
                                width: 100,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() =>
                              Text(_homePageController.organicCropText.value)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: _homePageController.selectedOrganic.value
                    //     ? ourMainColor
                    //     : Colors.green,
                    border: Border.all(
                      width: 5,
                      color: _homePageController.selectedOrganic.value
                          ? ourMainColor
                          : Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => Text(
                          'Current Phase'.toUpperCase(),
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              color: _homePageController.selectedOrganic.value
                                  ? ourMainColor
                                  : Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => Text(
                          'First Quartely Transition',
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: _homePageController.selectedOrganic.value
                                ? ourMainColor
                                : Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                children: [
                  Obx(
                    () => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 80,

                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: _homePageController.selectedOrganic.value
                              ? ourMainColor
                              : Colors.green),
                      //
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${_homePageController.firstDabbaTitle}'
                                  .toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Text(
                                '${_homePageController.firstDabbaText}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 23, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 80,

                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: _homePageController.selectedOrganic.value
                              ? ourMainColor
                              : Colors.green),
                      //
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${_homePageController.secondDabbaTitle}'
                                  .toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Text(
                                '${_homePageController.secondDabbaText}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 23, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 80,

                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: _homePageController.selectedOrganic.value
                              ? ourMainColor
                              : Colors.green),
                      //
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${_homePageController.thirdDabbaTitle}'
                                  .toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Column(
                                children: [
                                  Text(
                                    '${_homePageController.thirdDabbaText}',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 80,

                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: _homePageController.selectedOrganic.value
                              ? ourMainColor
                              : Colors.green),
                      //
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${_homePageController.fourthDabbaTitle}'
                                  .toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Text(
                                '${_homePageController.fourthDabbaText}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 23, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 80,

                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: _homePageController.selectedOrganic.value
                              ? ourMainColor
                              : Colors.green),
                      //
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${_homePageController.fifthDabbaTitle}'
                                  .toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Text(
                                '${_homePageController.fifthDabbaText}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 23, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 80,

                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: _homePageController.selectedOrganic.value
                              ? ourMainColor
                              : Colors.green),
                      //
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${_homePageController.sixthDabbaTitle}'
                                  .toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Text(
                                    '${_homePageController.sixthDabbaText}',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 23, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Container(
                  margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: _homePageController.selectedOrganic.value
                          ? ourMainColor
                          : Colors.green),
                  child: Column(
                    children: [
                      Text(
                        'Current Task'.toUpperCase(),
                        style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Pre-Seeding',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Time Required - ${_homePageController.selectedOrganic.value ? 30 : 20} Days',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Labour Required - ${_homePageController.selectedOrganic.value ? 20 : 40}',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Capitol Required - ₹${_homePageController.selectedOrganic.value ? 200000 : 400000}',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          final Uri _url = Uri.parse(
                              'https://youtube.com/playlist?list=PLbRMhDVUMngdhPkxPPakK2aOQD47DQPMIv');
                          //launchUrl(_url);
                        },
                        icon: const Icon(Icons.support_agent),
                        label: Text(
                          'Need Help',
                          style: GoogleFonts.montserrat(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: _homePageController.selectedOrganic.value
                          ? ourMainColor
                          : Colors.green),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Government Schemes'.toUpperCase(),
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'Parmaparagat Krishi Vikas Yojna',
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Paramparagat Krishi Vikas Yojana promotes cluster based organic farming with PGS (Participatory Guarantee System) certification.',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // launchUrl(Uri.parse(
                            //     "https://dmsouthwest.delhi.gov.in/scheme/paramparagat-krishi-vikas-yojana/#:~:text=The%20Paramparagat%20Krishi%20Vikas%20Yojana,in%20improvement%20of%20soil%20health"));
                          },
                          child: Text(
                            'Apply',
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Mission Organic (MOVCDNER)',
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'The scheme promotes third party certified organic farming of niche crops of north east region through Farmer Producer Organisations (FPOs) with focus on exports.',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final Uri _url =
                                Uri.parse('https://movcd.dac.gov.in/');
                            //launchUrl(_url);
                          },
                          child: Text(
                            'Apply',
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Capital Investment Subsidy',
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Under this scheme, 100 percent assistance is provided to state government, government agencies for setting up of mechanised fruit and vegetable market waste, agro waste compost production unit up to a maximum limit of Rs 190 lakh per unit (3000 Total Per Annum TPA capacity)',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final Uri _url = Uri.parse(
                                'https://ncof.dacnet.nic.in/uploads/SchemaGuidelines/Capital_Investment_Subsidy_Scheme_CISS_Guidelines.pdf');
                            //launchUrl(_url);
                          },
                          child: Text(
                            'Apply',
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'NMOOP',
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Under the Mission, financial assistance at 50 percent subsidy to the tune of Rs. 300 per hectare is being provided for different components including bio-fertilisers, supply of Rhizobium culture, Phosphate Solubilising Bacteria (PSB), Zinc Solubilising Bacteria (ZSB), Azatobacter, Mycorrhiza and vermi compost.',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final Uri _url = Uri.parse('https://nmoop.gov.in/');
                            //launchUrl(_url);
                          },
                          child: Text(
                            'Apply',
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'National Food Security Mission',
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Under NFSM, financial assistance is provided for promotion of bio-fertiliser (Rhizobium/PSB) at 50 percent of the cost limited to Rs 300 per hectare.',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final Uri _url =
                                Uri.parse('https://www.nfsm.gov.in/');
                            //launchUrl(_url);
                          },
                          child: Text(
                            'Apply',
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'My Profile',
          ),
        ],
        currentIndex: _globalStuffController.selectedPage.value,
        onTap: (int index) => _onItemTapped(index, context),
      ),
    );
  }
}

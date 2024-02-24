import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import './controllers/marketplace_controller.dart';

import 'controllers/global_stuff_controller.dart';
import 'widgets/custom_app_bar.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  final Color ourMainColor = const Color.fromRGBO(202, 103, 36, 1);

  final Color secondary = const Color.fromRGBO(15, 99, 11, 1);

  final GlobalStuffController _globalStuffController =
      Get.find<GlobalStuffController>();

  final MarketPlaceController _marketPlaceController =
      Get.put(MarketPlaceController());

  void _onItemTapped(int index, BuildContext context) {
    _globalStuffController.selectedPage.value = index;
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/home');
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed('/profile');
        break;
      default:
    }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {
                        _marketPlaceController.selectedType.value = 0;
                        _marketPlaceController.totalProductsArray.value = [
                          0,
                          0,
                          0,
                          0
                        ];
                        _marketPlaceController.modified.value = [0, 0, 0, 0];
                      },
                      child: Column(
                        children: [
                          Container(
                            child: const Image(
                              image: AssetImage('assets/images/seed.png'),
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Seeds'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {
                        _marketPlaceController.selectedType.value = 1;
                        _marketPlaceController.totalProductsArray.value = [
                          0,
                          0,
                          0,
                          0
                        ];
                        _marketPlaceController.modified.value = [0, 0, 0, 0];
                      },
                      child: Column(
                        children: [
                          Container(
                            child: const Image(
                              image: AssetImage('assets/images/fertlizers.png'),
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Manure'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {
                        _marketPlaceController.selectedType.value = 2;
                        _marketPlaceController.totalProductsArray.value = [
                          0,
                          0,
                          0,
                          0
                        ];
                        _marketPlaceController.modified.value = [0, 0, 0, 0];
                      },
                      child: Column(
                        children: [
                          Container(
                            child: const Image(
                              image: AssetImage('assets/images/sickle.png'),
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Tools'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Products Available',
                style: GoogleFonts.montserrat(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Column(
                  children: _marketPlaceController.getListOfWidgets(
                      _marketPlaceController.totalProductsArray))),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text('Buy Now'),
                        icon: Badge(
                          label: Obx(
                            () => Text(
                              "${_marketPlaceController.totalProducts}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          alignment: AlignmentDirectional.bottomCenter,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/global_stuff_controller.dart';
import 'widgets/custom_app_bar.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final Color ourMainColor = const Color.fromRGBO(202, 103, 36, 1);

  final Color secondary = const Color.fromRGBO(15, 99, 11, 1);

  final GlobalStuffController _globalStuffController =
      Get.find<GlobalStuffController>();

  SharedPreferences? _preferences;

  void _onItemTapped(int index, BuildContext context) {
    _globalStuffController.selectedPage.value = index;
    switch (index) {
      case 1:
        Navigator.of(context).pushReplacementNamed('/marketplace');
        break;
      case 0:
        Navigator.of(context).pushReplacementNamed('/home');
        break;
      default:
    }
  }

  List<Widget> getCapsuleWidgets(List<String>? listToIterate) {
    List<Widget> capsuleWidgets = [];
    if (listToIterate == null) {
      return capsuleWidgets;
    }
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
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            labelStyle: const TextStyle(
              color: Colors.white,
            ),
            disabledColor: ourMainColor,
            selectedColor: ourMainColor,
            selected: true,
            showCheckmark: false,
            onSelected: (bool value) {},
          ),
        ),
      );
    }
    return capsuleWidgets;
  }

  Future<void> setPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                            image:
                                AssetImage('assets/images/organimatelogo.png'),
                            width: 200,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 30, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/images/farmervector.png'),
                              width: 200,
                              height: 200,
                            ),
                            Image(
                              image:
                                  AssetImage('assets/images/organicscore.png'),
                              width: 150,
                              height: 150,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await _preferences?.clear();

                                Navigator.of(context).pushReplacementNamed('/');
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ourMainColor),
                              child: const SizedBox(
                                width: 200,
                                child: Center(
                                    child: Text(
                                  'Logout',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 30, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Personal Details',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Name:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text('${_preferences?.getString('name')}')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Contact:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text('${_preferences?.getString('contact')}')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Place:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text(
                                '${_preferences?.getString('district')}, ${_preferences?.getString('state')}')
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Crops Grown:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Wrap(
                          children: getCapsuleWidgets(
                            _preferences?.getStringList('cropsGrownList'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fertlisers Used:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Wrap(
                          children: getCapsuleWidgets(
                            _preferences?.getStringList('fertilisersUsedList'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pesticides Used:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Wrap(
                          children: getCapsuleWidgets(
                            _preferences?.getStringList('pesticidesUsedList'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 30, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Last Crop Grown Details',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Last Year Budget:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text('${_preferences?.getString('lastYearBudget')}')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Last Year Profit:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text('${_preferences?.getString('lastYearProfit')}')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'People Employed:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text('${_preferences?.getString('peopleEmployed')}')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Yield Produced:',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text(
                                '${_preferences?.getString('lastYearYield')} tons')
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            }),
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

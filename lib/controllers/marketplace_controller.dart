import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketPlaceController extends GetxController {
  var totalProducts = 0.obs;
  var selectedType = 0.obs;

  var totalProductsArray = [0, 0, 0, 0].obs;
  var modified = [0, 0, 0, 0].obs;

  List<Widget> getListOfOldWidgets(List<int> totalProductsArray) {
    List<Widget> toReturn = [];
    if (selectedType.value == 0) {
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage('assets/images/Astra.png'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Manure',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(Tata Chemicals)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 3.5/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 80%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[0] == 0) {
                                        return;
                                      }

                                      totalProductsArray[0] -= 1;

                                      modified[0] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[0]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[0] += 1;

                                    modified[0] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[0];
                              modified[0] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
    } else if (selectedType.value == 1) {
    } else {}

    return toReturn;
  }

  List<Widget> getListOfWidgets(List<int> totalProductsArray) {
    List<Widget> toReturn = [];
    if (selectedType.value == 0) {
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Image(
                            image: AssetImage('assets/images/Ugaoovseeds.jpeg'),
                            width: 72,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Vegetable seeds',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '(Ugaoo)',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rating: 4.2/5',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("|"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'OrganiScore: 90%',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '₹449/-',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (totalProductsArray[0] == 0) {
                                            return;
                                          }

                                          totalProductsArray[0] -= 1;

                                          modified[0] -= 1;
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text("${totalProductsArray[0]}"),
                                    IconButton(
                                      onPressed: () {
                                        totalProductsArray[0] += 1;

                                        modified[0] += 1;
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  totalProducts += modified[0];
                                  modified[0] = 0;
                                },
                                child: const Text('Add to Cart'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Image(
                            image: AssetImage('assets/images/neuherbs.png'),
                            width: 72,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Flax',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '& Chia Seeds',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '(Neuherbs)',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rating: 4.0/5',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("|"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'OrganiScore: 85%',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '₹529/-',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (totalProductsArray[1] == 0) {
                                            return;
                                          }

                                          totalProductsArray[1] -= 1;

                                          modified[1] -= 1;
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text("${totalProductsArray[1]}"),
                                    IconButton(
                                      onPressed: () {
                                        totalProductsArray[1] += 1;

                                        modified[1] += 1;
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  totalProducts += modified[1];
                                  modified[1] = 0;
                                },
                                child: const Text('Add to Cart'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Image(
                            image:
                                AssetImage('assets/images/moskahempseeds.png'),
                            width: 72,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hemp seeds',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                '(Moska)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rating: 3.7/5',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("|"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'OrganiScore: 80%',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '₹195/-',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (totalProductsArray[2] == 0) {
                                            return;
                                          }

                                          totalProductsArray[2] -= 1;

                                          modified[2] -= 1;
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text("${totalProductsArray[2]}"),
                                    IconButton(
                                      onPressed: () {
                                        totalProductsArray[2] += 1;

                                        modified[2] += 1;
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  totalProducts += modified[2];
                                  modified[2] = 0;
                                },
                                child: const Text('Add to Cart'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Image(
                            image: AssetImage('assets/images/all.png'),
                            width: 72,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Culinary Herb Kit',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                '(All That Grows)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rating: 3.5/5',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("|"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'OrganiScore: 78%',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '₹850/-',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (totalProductsArray[3] == 0) {
                                            return;
                                          }

                                          totalProductsArray[3] -= 1;

                                          modified[3] -= 1;
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text("${totalProductsArray[3]}"),
                                    IconButton(
                                      onPressed: () {
                                        totalProductsArray[3] += 1;

                                        modified[3] += 1;
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  totalProducts += modified[3];
                                  modified[3] = 0;
                                },
                                child: const Text('Add to Cart'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else if (selectedType.value == 1) {
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage('assets/images/no-virus.png'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No-virus',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(Geolife)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 5/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 90%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹1060/-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[0] == 0) {
                                        return;
                                      }

                                      totalProductsArray[0] -= 1;

                                      modified[0] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[0]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[0] += 1;

                                    modified[0] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[0];
                              modified[0] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage('assets/images/SJVermicompost.jpg'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Organic Vermicompost',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' Manure',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(TrustBasket)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 4.5/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 85%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹299/-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[1] == 0) {
                                        return;
                                      }

                                      totalProductsArray[1] -= 1;

                                      modified[1] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[1]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[1] += 1;

                                    modified[1] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[1];
                              modified[1] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image:
                            AssetImage('assets/images/ugaoovermicompost.jpg'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Organic Vermicompost',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(Ugaoo)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 3.0/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 80%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹249/-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[2] == 0) {
                                        return;
                                      }

                                      totalProductsArray[2] -= 1;

                                      modified[2] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[2]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[2] += 1;

                                    modified[2] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[2];
                              modified[2] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage('assets/images/organicdews.jpg'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Liquid Seaweed Extract',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(OrganicDews)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 3.5/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 80%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹242/-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[3] == 0) {
                                        return;
                                      }

                                      totalProductsArray[3] -= 1;

                                      modified[3] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[3]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[3] += 1;

                                    modified[3] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[3];
                              modified[3] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage('assets/images/Broadfork.png'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Broadfork',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(Treadlite)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 5/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 90%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹19,423/-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[0] == 0) {
                                        return;
                                      }

                                      totalProductsArray[0] -= 1;

                                      modified[0] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[0]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[0] += 1;

                                    modified[0] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[0];
                              modified[0] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage(
                            'assets/images/amazon-gardening-shears.jpg'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Gardening Shears',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(AeroGarden)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 4.5/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 85%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹253/-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[1] == 0) {
                                        return;
                                      }

                                      totalProductsArray[1] -= 1;

                                      modified[1] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[1]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[1] += 1;

                                    modified[1] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[1];
                              modified[1] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage('assets/images/growers.png'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '30" Bed Prep Rake',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(Growers)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 4.0/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 80%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹15,620/-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[2] == 0) {
                                        return;
                                      }

                                      totalProductsArray[2] -= 1;

                                      modified[2] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[2]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[2] += 1;

                                    modified[2] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[2];
                              modified[2] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
      toReturn.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage('assets/images/victorinox.png'),
                        width: 72,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Serrated Knife',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '(Victorinox)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: 3/5',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("|"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OrganiScore: 70%',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹3,323/-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (totalProductsArray[3] == 0) {
                                        return;
                                      }

                                      totalProductsArray[3] -= 1;

                                      modified[3] -= 1;
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("${totalProductsArray[3]}"),
                                IconButton(
                                  onPressed: () {
                                    totalProductsArray[3] += 1;

                                    modified[3] += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              totalProducts += modified[3];
                              modified[3] = 0;
                            },
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return toReturn;
  }
}

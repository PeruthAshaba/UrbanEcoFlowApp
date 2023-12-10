import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:urbanecoflow/pages/widgets/app_button_widget.dart';
import 'package:urbanecoflow/utils/colors.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final String types;
  final String importance;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.types,
    required this.importance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'types': types,
      'importance': importance,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      types: map['types'] as String,
      importance: map['importance'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<CategoryModel> _categories = [
  CategoryModel(
      id: '1',
      name: 'Industrial Waste',
      image: "assets/images/scrap.jpg",
      description: 'Created in factories and industries.',
      types: 'Plastics and Glasses',
      importance: 'Recycle Reuse Reduce'),
  CategoryModel(
      id: '2',
      name: "Commercial Waste",
      image: "assets/images/collection.jpg",
      description: "In schools, colleges, shops and offices",
      types: "Plastic, paper, furniture",
      importance: "Recycle Reuse Reduce"),
  CategoryModel(
      id: '3',
      name: "Domestic Waste",
      image: "assets/images/imag3.png",
      description: "Household Wastes",
      types: "Food waste, plastics and packaging",
      importance: "Recycling, Disposal"),
  CategoryModel(
      id: '4',
      name: "Food Waste",
      image: "assets/images/waste.jpg",
      description: "From Restaurants, Hotels",
      types: "Discarding or loss of edible food ",
      importance: "Reduce Recycle Reuse"),
];

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: StaggeredGrid.count(
          // childAspectRatio: 0.68,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          // physics: const NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
          children: _categories
              .map(
                (e) => Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(e.image))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(15)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            e.name,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Row(),
                                                  Text(
                                                    e.description,
                                                    style: const TextStyle(
                                                        fontSize: 13),
                                                  ),
                                                  Text(
                                                    e.types,
                                                    style: const TextStyle(
                                                        fontSize: 13),
                                                  ),
                                                  Text(
                                                    e.importance,
                                                    style: const TextStyle(
                                                        fontSize: 13),
                                                  ),
                                                ]),
                                          ),
                                          AppButtonWidget(
                                              onTap: Navigator.of(context).pop,
                                              child: const Text(
                                                'Okay',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: whiteColor),
                                              ))
                                        ]),
                                    // title: const Text(
                                    //   'Industrial Waste',
                                    //   textAlign: TextAlign.center,
                                    //   style: TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: primaryColor),
                                    // ),
                                    // actions: [
                                    //   AppButtonWidget(
                                    //       onTap: Navigator.of(context).pop,
                                    //       child: const Text(
                                    //         'Okay',
                                    //         style: TextStyle(
                                    //             fontSize: 16,
                                    //             fontWeight: FontWeight.bold,
                                    //             color: whiteColor),
                                    //       ))
                                    // ],
                                  ),
                                )),
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.info, color: whiteColor)),
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          e.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Image.asset(
                      //   "assets/images/scrap.jpg",
                      //   fit: BoxFit.cover,
                      // ),
                      // Container(
                      //   padding: const EdgeInsets.only(bottom: 8),
                      //   alignment: Alignment.centerLeft,
                      //   child: const Text(
                      //     "Created in factories and industries.",
                      //     style: TextStyle(
                      //       fontSize: 15,
                      //       color: Colors.green,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   alignment: Alignment.centerLeft,
                      //   child: const Text(
                      //     "Plastics and Glasses ",
                      //     style: TextStyle(
                      //       fontSize: 10,
                      //       color: Colors.green,
                      //     ),
                      //   ),
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 10),
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Text(
                      //           "Recycle Reuse Reduce",
                      //           style: TextStyle(
                      //             fontSize: 9,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.green,
                      //           ),
                      //         ),
                      //       ]),
                      // )
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}

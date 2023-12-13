import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImpactModel {
  final String id;
  final String name;
  final String description;
  final String importance;
  ImpactModel({
    required this.id,
    required this.name,
    required this.description,
    required this.importance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'importance': importance,
    };
  }

  factory ImpactModel.fromMap(Map<String, dynamic> map) {
    return ImpactModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      importance: map['importance'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImpactModel.fromJson(String source) =>
      ImpactModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<ImpactModel> _impacts = [
  ImpactModel(
      id: '1',
      name: 'Environmental Impact',
      description:
          'Prevention of Pollution: Urban EcoFlow helps prevent pollution by removing and properly disposing of potentially hazardous materials. It reduces the risk of soil, air, and water pollution.',
      importance: 'Recycle Reuse Reduce'),
  ImpactModel(
      id: '2',
      name: "Public Health",
      description:
          "Inadequate waste collection can lead to the proliferation of disease vectors such as rats and mosquitoes. Proper waste collection helps control these vectors, reducing the risk of diseases.",
      importance: "Recycle Reuse Reduce"),
  ImpactModel(
      id: '3',
      name: "Reduction of illegal Dumping",
      description:
          "Regular and accessible waste collection services reduce the likelihood of illegal dumping, which can harm the environment and public health.",
      importance: "Recycling, Disposal"),
];

class TrendWidget extends StatelessWidget {
  const TrendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StaggeredGrid.count(
          // childAspectRatio: 0.68,
          crossAxisCount: 1,
          // physics: const NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
          mainAxisSpacing: 20,
          children: _impacts
              .map((e) => Container(
                    // margin:
                    //     const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            e.name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            e.description,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.importance,
                                  style: const TextStyle(
                                    fontSize: 7,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ))
              .toList()
          //   [
          // //one
          //     Container(
          //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          //       padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Column(
          //         children: [
          //           InkWell(
          //             onTap: () {},
          //             child: Container(
          //               margin: const EdgeInsets.all(10),
          //               child: Image.asset(
          //                 "assets/images/img1.png",
          //                 height: 200,
          //                 width: 250,
          //               ),
          //             ),
          //           ),
          //           Container(
          //             padding: const EdgeInsets.only(bottom: 8),
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Keeping the environment clean",
          //               style: TextStyle(
          //                 fontSize: 15,
          //                 color: Colors.green,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.symmetric(vertical: 10),
          //             child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     "Save 12.105 Trees",
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.green,
          //                     ),
          //                   ),
          //                 ]),
          //           )
          //         ],
          //       ),
          //     ),

          // // two
          //     Container(
          //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          //       padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Column(
          //         children: [
          //           Container(
          //             padding: const EdgeInsets.only(bottom: 8),
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Environmental Impact",
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           Container(
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Prevention of Pollution: Urban EcoFlow helps prevent pollution by removing and properly disposing of potentially hazardous materials. It reduces the risk of soil, air, and water pollution.",
          //               style: TextStyle(
          //                 fontSize: 15,
          //                 color: Colors.black,
          //               ),
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.symmetric(vertical: 10),
          //             child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     "Reduce Recycle Reuse",
          //                     style: TextStyle(
          //                       fontSize: 7,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.green,
          //                     ),
          //                   ),
          //                 ]),
          //           )
          //         ],
          //       ),
          //     ),
          //     //three
          //     Container(
          //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          //       padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Column(
          //         children: [
          //           InkWell(
          //             onTap: () {},
          //             child: Container(
          //               margin: const EdgeInsets.all(10),
          //               child: Image.asset(
          //                 "assets/images/imag3.png",
          //                 height: 200,
          //                 width: 250,
          //               ),
          //             ),
          //           ),
          //           Container(
          //             padding: const EdgeInsets.only(bottom: 8),
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Keeping the environment clean",
          //               style: TextStyle(
          //                 fontSize: 15,
          //                 color: Colors.green,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.symmetric(vertical: 10),
          //             child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     "Save 12.105 Trees",
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.green,
          //                     ),
          //                   ),
          //                 ]),
          //           )
          //         ],
          //       ),
          //     ),

          //     Container(
          //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          //       padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Column(
          //         children: [
          //           Container(
          //             padding: const EdgeInsets.only(bottom: 8),
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Public Health",
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           Container(
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Inadequate waste collection can lead to the proliferation of disease vectors such as rats and mosquitoes. Proper waste collection helps control these vectors, reducing the risk of diseases.",
          //               style: TextStyle(
          //                 fontSize: 15,
          //                 color: Colors.black,
          //               ),
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.symmetric(vertical: 10),
          //             child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     "Reduce Recycle Reuse",
          //                     style: TextStyle(
          //                       fontSize: 7,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.green,
          //                     ),
          //                   ),
          //                 ]),
          //           )
          //         ],
          //       ),
          //     ),
          //     //four
          //     Container(
          //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          //       padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Column(
          //         children: [
          //           InkWell(
          //             onTap: () {},
          //             child: Container(
          //               margin: const EdgeInsets.all(10),
          //               child: Image.asset(
          //                 "assets/images/imag4.png",
          //                 height: 200,
          //                 width: 250,
          //               ),
          //             ),
          //           ),
          //           Container(
          //             padding: const EdgeInsets.only(bottom: 8),
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Keeping the environment clean",
          //               style: TextStyle(
          //                 fontSize: 15,
          //                 color: Colors.green,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.symmetric(vertical: 10),
          //             child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     "Save 12.105 Trees",
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.green,
          //                     ),
          //                   ),
          //                 ]),
          //           )
          //         ],
          //       ),
          //     ),
          //     Container(
          //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          //       padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Column(
          //         children: [
          //           Container(
          //             padding: const EdgeInsets.only(bottom: 8),
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Reduction of illegal Dumping",
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           Container(
          //             alignment: Alignment.centerLeft,
          //             child: const Text(
          //               "Regular and accessible waste collection services reduce the likelihood of illegal dumping, which can harm the environment and public health.",
          //               style: TextStyle(
          //                 fontSize: 15,
          //                 color: Colors.black,
          //               ),
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.symmetric(vertical: 10),
          //             child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     "Reduce Recycle Reuse",
          //                     style: TextStyle(
          //                       fontSize: 7,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.green,
          //                     ),
          //                   ),
          //                 ]),
          //           )
          //         ],
          //       ),
          //     ),
          //   ],

          ),
    );
  }
}

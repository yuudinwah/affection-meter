// import 'dart:math';

import 'package:affectionmeter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Affection Meter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool loading = false;
//   bool showResult = false;
//   bool showHint = false;
//   TextEditingController yourName = TextEditingController();
//   TextEditingController partnerName = TextEditingController();
//   String yourGender = 'Male';
//   String partnerGender = 'Female';
//   int value = 0;
//   List<Map<String, dynamic>> genders = [
//     {
//       "id": "Male",
//       "name": "Laki-laki",
//       "color": Colors.blue,
//       "icon": Icons.male,
//     },
//     {
//       "id": "Female",
//       "name": "Perempuan",
//       "color": Colors.red,
//       "icon": Icons.female,
//     },
//   ];

//   Map<String, dynamic> ourLevel(int point) {
//     try {
//       for (Map<String, dynamic> l in levels) {
//         if (point >= l['minPoint'] && point <= l['maxPoint']) {
//           throw l;
//         }
//       }
//       return levels.last;
//     } catch (e) {
//       if (e is Map<String, dynamic>) {
//         return e;
//       } else {
//         return levels.first;
//       }
//     }
//   }

//   List<Map<String, dynamic>> levels = [
//     {
//       "minPoint": 0,
//       "maxPoint": 9999,
//       "color": Colors.grey[500],
//       "id": "Hitam",
//       "name": "Teman",
//     },
//     {
//       "minPoint": 10000,
//       "maxPoint": 19999,
//       "color": Colors.purple[300],
//       "id": "Ungu",
//       "name": "Teman",
//     },
//     {
//       "minPoint": 20000,
//       "maxPoint": 29999,
//       "color": Colors.blue,
//       "id": "Biru",
//       "name": "Teman Dekat",
//     },
//     {
//       "minPoint": 30000,
//       "maxPoint": 39999,
//       "color": Colors.green,
//       "id": "Hijau",
//       "name": "Tertarik",
//     },
//     {
//       "minPoint": 40000,
//       "maxPoint": 49999,
//       "color": Colors.yellow,
//       "id": "Kuning",
//       "name": "Crush",
//     },
//     {
//       "minPoint": 50000,
//       "maxPoint": 59999,
//       "color": Colors.orange,
//       "id": "Jingga",
//       "name": "Sangat Tertarik",
//     },
//     {
//       "minPoint": 60000,
//       "maxPoint": 99999,
//       "color": Colors.red,
//       "id": "Merah",
//       "name": "Lover",
//     },
//   ];

//   int valueChar(String value) {
//     switch (value.toLowerCase()) {
//       case 'A':
//         return 65;
//       case 'B':
//         return 66;
//       case 'C':
//         return 67;
//       case 'D':
//         return 68;
//       case 'E':
//         return 69;
//       case 'F':
//         return 70;
//       case 'G':
//         return 71;
//       case 'H':
//         return 72;
//       case 'I':
//         return 73;
//       case 'J':
//         return 74;
//       case 'K':
//         return 75;
//       case 'L':
//         return 76;
//       case 'M':
//         return 77;
//       case 'N':
//         return 78;
//       case 'O':
//         return 79;
//       case 'P':
//         return 80;
//       case 'Q':
//         return 81;
//       case 'R':
//         return 82;
//       case 'S':
//         return 83;
//       case 'T':
//         return 84;
//       case 'U':
//         return 85;
//       case 'V':
//         return 86;
//       case 'W':
//         return 87;
//       case 'X':
//         return 88;
//       case 'Y':
//         return 89;
//       case 'Z':
//         return 90;
//       case 'a':
//         return 97;
//       case 'b':
//         return 98;
//       case 'c':
//         return 99;
//       case 'd':
//         return 100;
//       case 'e':
//         return 101;
//       case 'f':
//         return 102;
//       case 'g':
//         return 103;
//       case 'h':
//         return 104;
//       case 'i':
//         return 105;
//       case 'j':
//         return 106;
//       case 'k':
//         return 107;
//       case 'l':
//         return 108;
//       case 'm':
//         return 109;
//       case 'n':
//         return 110;
//       case 'o':
//         return 111;
//       case 'p':
//         return 112;
//       case 'q':
//         return 113;
//       case 'r':
//         return 114;
//       case 's':
//         return 115;
//       case 't':
//         return 116;
//       case 'u':
//         return 117;
//       case 'v':
//         return 118;
//       case 'w':
//         return 119;
//       case 'x':
//         return 120;
//       case 'y':
//         return 121;
//       case 'z':
//         return 122;
//       default:
//         return 96;
//     }
//   }

//   Future<void> getResult() async {
//     loading = true;
//     setState(() {});
//     int valuea = 0;
//     List<int> nsa = List.generate(yourName.text.split('').length,
//         (index) => valueChar(yourName.text.split('')[index]));
//     valuea = 0;
//     for (int a in nsa) {
//       valuea += a;
//     }
//     valuea = (valuea / nsa.length).ceil();
//     if (yourGender == 'Male') {
//       valuea = valuea * 2;
//     } else {
//       valuea = valuea * 3;
//     }
//     // if (yourName.text.split(' ').length > 1) {
//     //   valuea = yourName.text.split(' ').length - 1;
//     // }

//     int valueb = 0;
//     List<int> nsb = List.generate(partnerName.text.split('').length,
//         (index) => valueChar(partnerName.text.split('')[index]));
//     valueb = 0;
//     for (int a in nsb) {
//       valueb += a;
//     }
//     valueb = (valueb / nsb.length).ceil();
//     if (partnerGender == 'Male') {
//       valueb = valueb * 2;
//     } else {
//       valueb = valueb * 3;
//     }
//     // if (partnerName.text.split(' ').length > 1) {
//     //   valueb = partnerName.text.split(' ').length - 1;
//     // }

//     value = (valuea * valueb / 2).ceil();
//     String name =
//         '[$yourGender]${yourName.text} & [$partnerGender]${partnerName.text}';
//     try {
//       try {
//         DocumentSnapshot<Map<String, dynamic>> doc =
//             await FirebaseFirestore.instance.doc('#affectionmeter/$name').get();
//         if (doc.exists) {
//           value = doc.data()!['point'] ?? value;
//         }
//       } catch (_) {}
//       await FirebaseFirestore.instance.doc('#affectionmeter/$name').update({
//         'times': FieldValue.increment(1),
//         "yourName": yourName.text,
//         "partnerName": partnerName.text,
//         "yourGender": yourGender,
//         "partnerGender": partnerGender,
//         "point": value,
//         "updatedAt": FieldValue.serverTimestamp(),
//       }).catchError((_) async {
//         await FirebaseFirestore.instance.doc('#affectionmeter/$name').set({
//           'times': 1,
//           "yourName": yourName.text,
//           "partnerName": partnerName.text,
//           "yourGender": yourGender,
//           "partnerGender": partnerGender,
//           "point": value,
//           "createdAt": FieldValue.serverTimestamp(),
//         });
//       });
//     } catch (_) {}

//     await Future.delayed(const Duration(seconds: 3));
//     loading = false;
//     showResult = true;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     double maxLeft = (MediaQuery.of(context).size.width - 480) / 2;
//     double maxTop = (MediaQuery.of(context).size.height - 240) / 2;
//     return Scaffold(
//       body: Container(
//         height: height,
//         width: width,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               'assets/images/bg.png',
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//             SizedBox(
//               height: height,
//               width: width,
//               child: Builder(builder: (context) {
//                 if (width > 1280 && height > 720 ||
//                     width > height && width > 720) {
//                   return Center(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 16,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       height: 340,
//                       width: 640,
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 16,
//                                       vertical: 16,
//                                     ),
//                                     constraints: const BoxConstraints(
//                                       maxWidth: 480,
//                                       maxHeight: 240,
//                                     ),
//                                     height: 240,
//                                     width: 240,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         SizedBox(
//                                           child: Text(
//                                             'Namamu',
//                                             style: TextStyle(
//                                               color: Colors.grey[700]!,
//                                               fontSize: 20,
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 16,
//                                         ),
//                                         TextField(
//                                           controller: yourName,
//                                           textAlign: TextAlign.center,
//                                           maxLines: 1,
//                                           decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 16,
//                                         ),
//                                         SizedBox(
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: List.generate(
//                                                 genders.length, (index) {
//                                               bool selected = genders[index]
//                                                       ['id'] ==
//                                                   yourGender;
//                                               return Column(
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: () {
//                                                       if (!selected) {
//                                                         partnerGender =
//                                                             yourGender;
//                                                         yourGender =
//                                                             genders[index]
//                                                                 ['id'];
//                                                         setState(() {});
//                                                       }
//                                                     },
//                                                     child: Container(
//                                                       margin: const EdgeInsets
//                                                           .symmetric(
//                                                         horizontal: 8,
//                                                       ),
//                                                       padding: const EdgeInsets
//                                                           .symmetric(
//                                                         horizontal: 16,
//                                                         vertical: 16,
//                                                       ),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(60),
//                                                         color: selected
//                                                             ? genders[index]
//                                                                 ['color']
//                                                             : Colors.grey[500],
//                                                       ),
//                                                       child: Icon(
//                                                         genders[index]['icon'],
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 8,
//                                                   ),
//                                                   Text(genders[index]['name']),
//                                                 ],
//                                               );
//                                             }),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 80,
//                                   alignment: Alignment.center,
//                                   child: InkWell(
//                                     onTap: () {
//                                       showHint = true;
//                                       setState(() {});
//                                     },
//                                     child: Container(
//                                       width: 40,
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           width: 1,
//                                           color: Colors.grey[500]!,
//                                         ),
//                                         borderRadius: BorderRadius.circular(40),
//                                       ),
//                                       child: const Icon(
//                                         Icons.favorite,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 16,
//                                       vertical: 16,
//                                     ),
//                                     constraints: const BoxConstraints(
//                                       maxWidth: 480,
//                                       maxHeight: 240,
//                                     ),
//                                     height: 240,
//                                     width: 240,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         SizedBox(
//                                           child: Text(
//                                             'Nama Pasangan mu',
//                                             style: TextStyle(
//                                               color: Colors.grey[700]!,
//                                               fontSize: 20,
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 16,
//                                         ),
//                                         TextField(
//                                           controller: partnerName,
//                                           textAlign: TextAlign.center,
//                                           maxLines: 1,
//                                           decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 16,
//                                         ),
//                                         SizedBox(
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: List.generate(
//                                                 genders.length, (index) {
//                                               bool selected = genders[index]
//                                                       ['id'] ==
//                                                   partnerGender;
//                                               return Column(
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: () {
//                                                       if (!selected) {
//                                                         yourGender =
//                                                             partnerGender;
//                                                         partnerGender =
//                                                             genders[index]
//                                                                 ['id'];
//                                                         setState(() {});
//                                                       }
//                                                     },
//                                                     child: Container(
//                                                       margin: const EdgeInsets
//                                                           .symmetric(
//                                                         horizontal: 8,
//                                                       ),
//                                                       padding: const EdgeInsets
//                                                           .symmetric(
//                                                         horizontal: 16,
//                                                         vertical: 16,
//                                                       ),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(60),
//                                                         color: selected
//                                                             ? genders[index]
//                                                                 ['color']
//                                                             : Colors.grey[500],
//                                                       ),
//                                                       child: Icon(
//                                                         genders[index]['icon'],
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 8,
//                                                   ),
//                                                   Text(genders[index]['name']),
//                                                 ],
//                                               );
//                                             }),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 80,
//                             width: width,
//                             alignment: Alignment.center,
//                             child: InkWell(
//                               onTap: () {
//                                 if (yourName.text.length > 3 &&
//                                     partnerName.text.length > 3) {
//                                   getResult();
//                                 } else {
//                                   showHint = true;
//                                   setState(() {});
//                                 }
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 32,
//                                   vertical: 16,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: const Text(
//                                   'Kalkulasi',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//                 return SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 16,
//                         ),
//                         margin: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 32,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         width: width,
//                         child: Column(
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                     vertical: 16,
//                                   ),
//                                   constraints: const BoxConstraints(
//                                     maxWidth: 480,
//                                     maxHeight: 240,
//                                   ),
//                                   height: 240,
//                                   width: 240,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         child: Text(
//                                           'Namamu',
//                                           style: TextStyle(
//                                             color: Colors.grey[700]!,
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 16,
//                                       ),
//                                       TextField(
//                                         controller: yourName,
//                                         textAlign: TextAlign.center,
//                                         maxLines: 1,
//                                         decoration: InputDecoration(
//                                           border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 16,
//                                       ),
//                                       SizedBox(
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: List.generate(
//                                               genders.length, (index) {
//                                             bool selected = genders[index]
//                                                     ['id'] ==
//                                                 yourGender;
//                                             return Column(
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     if (!selected) {
//                                                       partnerGender =
//                                                           yourGender;
//                                                       yourGender =
//                                                           genders[index]['id'];
//                                                       setState(() {});
//                                                     }
//                                                   },
//                                                   child: Container(
//                                                     margin: const EdgeInsets
//                                                         .symmetric(
//                                                       horizontal: 8,
//                                                     ),
//                                                     padding: const EdgeInsets
//                                                         .symmetric(
//                                                       horizontal: 16,
//                                                       vertical: 16,
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               60),
//                                                       color: selected
//                                                           ? genders[index]
//                                                               ['color']
//                                                           : Colors.grey[500],
//                                                     ),
//                                                     child: Icon(
//                                                       genders[index]['icon'],
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 const SizedBox(
//                                                   height: 8,
//                                                 ),
//                                                 Text(genders[index]['name']),
//                                               ],
//                                             );
//                                           }),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 80,
//                                   alignment: Alignment.center,
//                                   child: InkWell(
//                                     onTap: () {
//                                       showHint = true;
//                                       setState(() {});
//                                     },
//                                     child: Container(
//                                       width: 40,
//                                       height: 40,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           width: 1,
//                                           color: Colors.grey[500]!,
//                                         ),
//                                         borderRadius: BorderRadius.circular(40),
//                                       ),
//                                       child: const Icon(
//                                         Icons.favorite,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                     vertical: 16,
//                                   ),
//                                   constraints: const BoxConstraints(
//                                     maxWidth: 480,
//                                     maxHeight: 240,
//                                   ),
//                                   height: 240,
//                                   width: 240,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         child: Text(
//                                           'Nama Pasangan mu',
//                                           style: TextStyle(
//                                             color: Colors.grey[700]!,
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 16,
//                                       ),
//                                       TextField(
//                                         controller: partnerName,
//                                         textAlign: TextAlign.center,
//                                         maxLines: 1,
//                                         decoration: InputDecoration(
//                                           border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 16,
//                                       ),
//                                       SizedBox(
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: List.generate(
//                                               genders.length, (index) {
//                                             bool selected = genders[index]
//                                                     ['id'] ==
//                                                 partnerGender;
//                                             return Column(
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     if (!selected) {
//                                                       yourGender =
//                                                           partnerGender;
//                                                       partnerGender =
//                                                           genders[index]['id'];
//                                                       setState(() {});
//                                                     }
//                                                   },
//                                                   child: Container(
//                                                     margin: const EdgeInsets
//                                                         .symmetric(
//                                                       horizontal: 8,
//                                                     ),
//                                                     padding: const EdgeInsets
//                                                         .symmetric(
//                                                       horizontal: 16,
//                                                       vertical: 16,
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               60),
//                                                       color: selected
//                                                           ? genders[index]
//                                                               ['color']
//                                                           : Colors.grey[500],
//                                                     ),
//                                                     child: Icon(
//                                                       genders[index]['icon'],
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 const SizedBox(
//                                                   height: 8,
//                                                 ),
//                                                 Text(genders[index]['name']),
//                                               ],
//                                             );
//                                           }),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               height: 80,
//                               width: width,
//                               alignment: Alignment.center,
//                               child: InkWell(
//                                 onTap: () {
//                                   if (yourName.text.length >= 3 &&
//                                       partnerName.text.length >= 3) {
//                                     getResult();
//                                   } else {
//                                     showHint = true;
//                                     setState(() {});
//                                   }
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 32,
//                                     vertical: 16,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: const Text(
//                                     'Kalkulasi',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//             ),
//             if (loading)
//               Container(
//                 height: height,
//                 width: width,
//                 color: Colors.black.withOpacity(0.5),
//                 child: Center(
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     height: 80,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: StreamBuilder<void>(
//                         stream:
//                             Stream.periodic(const Duration(milliseconds: 600)),
//                         builder: (context, snapshot) {
//                           Random rnd = Random();
//                           return Icon(
//                             Icons.favorite,
//                             size: 50,
//                             color: levels[rnd.nextInt(levels.length - 1)]
//                                 ['color'],
//                           );
//                         }),
//                   ),
//                 ),
//               ),
//             if (showResult)
//               Container(
//                 height: height,
//                 width: width,
//                 color: Colors.black.withOpacity(0.5),
//                 child: Center(
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     padding: const EdgeInsets.all(16),
//                     width: width < 480 ? width : 480,
//                     height: 280,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           constraints: const BoxConstraints(
//                             minHeight: 40,
//                           ),
//                           child: Row(
//                             children: [
//                               const SizedBox(
//                                 height: 40,
//                                 width: 40,
//                               ),
//                               Expanded(
//                                 child: Center(
//                                   child: Text(
//                                     '${yourName.text} & ${partnerName.text}',
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 40,
//                                 width: 40,
//                                 child: InkWell(
//                                   onTap: () {
//                                     showResult = false;
//                                     setState(() {});
//                                   },
//                                   child: const Icon(Icons.close),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: SizedBox(
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 60,
//                                   child: Icon(
//                                     Icons.favorite,
//                                     color: ourLevel(value)['color'],
//                                     size: 80,
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 40,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         '$value',
//                                         style: TextStyle(
//                                           color: ourLevel(value)['color'],
//                                           fontSize: 26,
//                                         ),
//                                       ),
//                                       Text(
//                                         '/ ${ourLevel(value)['maxPoint']}',
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 40,
//                         ),
//                         SizedBox(
//                           height: 40,
//                           child: Text(
//                             '"${ourLevel(value)['name']}"',
//                             style: TextStyle(color: ourLevel(value)['color']),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             if (showHint)
//               Container(
//                 height: height,
//                 width: width,
//                 color: Colors.black.withOpacity(0.5),
//                 child: Center(
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     padding: const EdgeInsets.all(16),
//                     width: width < 480 ? width : 480,
//                     height: 280,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 40,
//                           child: Row(
//                             children: [
//                               const SizedBox(
//                                 height: 40,
//                                 width: 40,
//                               ),
//                               const Expanded(
//                                 child: Center(
//                                   child: Text(
//                                     'Petunjuk',
//                                     style: TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 40,
//                                 width: 40,
//                                 child: InkWell(
//                                   onTap: () {
//                                     showHint = false;
//                                     setState(() {});
//                                   },
//                                   child: const Icon(Icons.close),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text('1. Nama harus diisi'),
//                                 Text(
//                                     '2. Nama minimal memiliki panjang 3 huruf.'),
//                                 Text(
//                                     '3. Panjang nama akan berpengaruh terhadap point'),
//                                 Text(
//                                     '4. Besar kecilnya nama akan berpengaruh terhadap point.'),
//                                 Text(
//                                     '5. Point akan berpengaruh terhadap warna hati.'),
//                                 Text(
//                                     '6. Urutan warna hati diantaranya : Hitam, Ungu, Biru, Hijau, Kuning, Jingga dan Merah.'),
//                                 Text('7. Bukan ramalan.'),
//                                 Text('8. Just for fun.'),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 40,
//                         ),
//                         SizedBox(
//                           height: 40,
//                           width: width,
//                           child: Row(
//                             children: [
//                               const Expanded(
//                                 child: SizedBox(),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   showHint = false;
//                                   setState(() {});
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 32,
//                                     vertical: 8,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: Colors.blue,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: const Text(
//                                     'Mengerti',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.horizontal(
//                     right: Radius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'Created with 😏',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

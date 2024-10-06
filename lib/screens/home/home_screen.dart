// ignore_for_file: avoid_web_libraries_in_flutter, unnecessary_import

import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:affectionmeter/commons/extensions/buildcontext_extension.dart';
import 'package:affectionmeter/commons/extensions/string_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey globalKey = GlobalKey();

  bool musicStatus = false;
  bool isLoading = false;
  bool isStart = false;
  bool agreement = false;
  bool showHelp = false;

  int step = 0;
  TextEditingController myName = TextEditingController();
  TextEditingController myPartnerName = TextEditingController();

  double result = 0.0;

  Future<void> start() async {
    isLoading = true;
    isStart = true;
    refresh();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    isLoading = false;
    // isStart = false;
    nextStep();
    refresh();
  }

  void nextStep() async {
    step++;
    refresh();
    if (step == 3) {
      await Future.delayed(const Duration(seconds: 2));
      result = myName.text.checkAffection(myPartnerName.text);
      step = 4;
      refresh();
      await Future.delayed(const Duration(seconds: 1));
      step = 5;
      refresh();
    }
  }

  void restart() {
    isStart = false;
    isLoading = false;

    step = 0;
    myName.clear();
    myPartnerName.clear();
    refresh();
  }

  void refresh() {
    setState(() {});
  }

  Future<void> captureWidget() async {
    final dynamic boundary = (globalKey.currentContext!.findRenderObject());

    final ui.Image? image = await boundary!.toImage();

    final ByteData? byteData =
        await image!.toByteData(format: ui.ImageByteFormat.png);

    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    final content = base64Encode(pngBytes);
    const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');
    kIsWeb
        ? (html.AnchorElement(
            href:
                "data:application/octet-stream;charset=utf-16le;base64,$content")
          ..setAttribute("download", "${myName.text}&${myPartnerName.text}.png")
          ..click())
        : null;
  }

  @override
  Widget build(BuildContext context) {
    double width = context.width();
    double height = context.height();
    double margin = 0;
    if (width > 720) {
      margin = ((width - 720) / 2);
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: margin,
          ),
          height: height,
          width: width,
          color: Colors.pink[100],
          child: Stack(
            children: [
              if (step == 5)
                Positioned(
                  left: -width,
                  child: RepaintBoundary(
                    key: globalKey,
                    child: SizedBox(
                      height: 280,
                      width: 360,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 30,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 32,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    '${myName.text} & ${myPartnerName.text}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${result.round()}%",
                                        style: const TextStyle(
                                          fontSize: 32,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        "cocok",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: width,
                            alignment: Alignment.center,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Center(
                                child: LottieBuilder.asset(
                                  "assets/images/animations/animation-profile.json",
                                  height: 50,
                                  width: 50,
                                  // repeat: true,
                                  // frameRate: FrameRate(1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Container(
                    //   height: 50,
                    //   width: 50,
                    //   decoration: BoxDecoration(
                    //     color: Colors.pink,
                    //     borderRadius: BorderRadius.circular(25),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         offset: const Offset(0, 4),
                    //         blurRadius: 8,
                    //         color: Colors.black.withOpacity(0.1),
                    //       ),
                    //     ],
                    //   ),
                    //   child: const Icon(
                    //     Icons.music_note_outlined,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        showHelp = true;
                        refresh();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.question_mark_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Builder(
                  builder: (_) {
                    if (!isStart) {
                      return SizedBox(
                        height: height,
                        width: width,
                        child: Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                child: LottieBuilder.asset(
                                  "assets/images/animations/animation-bg-start.json",
                                ),
                              ),
                            ),
                            Center(
                              child: InkWell(
                                onTap: () => start(),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 4),
                                        blurRadius: 8,
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Mulai',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    if (isStart && step == 0) {
                      return SizedBox(
                        height: height,
                        width: width,
                        child: Center(
                          child: SizedBox(
                            child: LottieBuilder.asset(
                              "assets/images/animations/animation-start.json",
                            ),
                          ),
                        ),
                      );
                    }
                    if (isStart && step > 0) {
                      if (step == 1) {
                        return SizedBox(
                          height: height,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 280,
                                width: 360,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: width,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 32,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            const Text(
                                              'Masukkan namamu',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            TextField(
                                              controller: myName,
                                              onChanged: (_) {
                                                refresh();
                                              },
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (myName.text.isNotEmpty)
                                      Positioned(
                                        right: 0,
                                        top: 180,
                                        child: InkWell(
                                          onTap: () {
                                            nextStep();
                                          },
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: const Icon(
                                              Icons.send_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Container(
                                      height: 80,
                                      width: width,
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: Center(
                                          child: LottieBuilder.asset(
                                            "assets/images/animations/animation-profile.json",
                                            height: 50,
                                            width: 50,
                                            // repeat: true,
                                            // frameRate: FrameRate(1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      if (step == 2) {
                        return SizedBox(
                          height: height,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 280,
                                width: 360,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: width,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 32,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            const Text(
                                              'Masukkan nama pasanganmu',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            TextField(
                                              controller: myPartnerName,
                                              onChanged: (_) {
                                                refresh();
                                              },
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (myPartnerName.text.isNotEmpty)
                                      Positioned(
                                        right: 0,
                                        top: 180,
                                        child: InkWell(
                                          onTap: () {
                                            nextStep();
                                          },
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: const Icon(
                                              Icons.send_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Container(
                                      height: 80,
                                      width: width,
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: Center(
                                          child: LottieBuilder.asset(
                                            "assets/images/animations/animation-profile.json",
                                            height: 50,
                                            width: 50,
                                            // repeat: true,
                                            // frameRate: FrameRate(1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      if (step == 3) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (step == 4) {
                        return Center(
                          // child: CircularProgressIndicator(),
                          child: SizedBox(
                            child: LottieBuilder.asset(
                              "assets/images/animations/animation-start.json",
                            ),
                          ),
                        );
                      }
                      if (step == 5) {
                        return SizedBox(
                          height: height,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 280,
                                width: 360,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: width,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 32,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              '${myName.text} 💘 ${myPartnerName.text}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${result.round()}%",
                                                  style: const TextStyle(
                                                    fontSize: 32,
                                                    color: Colors.pink,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                const Text(
                                                  "cocok",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 80,
                                      width: width,
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: Center(
                                          child: LottieBuilder.asset(
                                            "assets/images/animations/animation-profile.json",
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // if (step == 5)
                              Container(
                                alignment: Alignment.center,
                                width: width,
                                child: SizedBox(
                                  width: 360,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            restart();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "Kembali",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            captureWidget();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "Download",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                    return const SizedBox();
                  },
                ),
              ),
              if (showHelp)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        const Expanded(
                          child: SizedBox(),
                        ),
                        IconButton(
                          onPressed: () {
                            showHelp = false;
                            refresh();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 32,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: const Column(
                            children: [
                              Text(
                                "Cara Menggunakan",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Text('#.'),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                          "Website ini hanya diperuntukkan untuk seru-seruan dan hiburan, tidak ada maksud untuk menyinggung siapapun dalam bentuk apapun."),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Text('1.'),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                          "Ayo coba seberapa cocok kamu dengan pasanganmu di website ini."),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Text('2.'),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                          "Klik 'mulai', lalu masukkan namamu dan nama pasanganmu."),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Text('3.'),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                          "Point kecocokanmu akan muncul diakhir."),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    child: Text('4.'),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                          "Share pengalamanmu dengan mendownload hasil generate kecocokanmu dengan pasanganmu."),
                                    ),
                                  ),
                                ],
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
        ),
      ),
    );
  }
}

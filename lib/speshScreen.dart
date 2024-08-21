import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shayari_app/logicClass.dart';
import 'package:shayari_app/main.dart';

class Splesh extends StatefulWidget {
  const Splesh({super.key});

  @override
  State<Splesh> createState() => _SpleshState();
}

class _SpleshState extends State<Splesh> {
  @override
  void initState() {
    logo = objlogic.setlogo().value;
    img = objlogic.setimg().value;
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(milliseconds: 3500),
      () async => await Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const MainPage(),
        ),
      ),
    );
  }

  late String logo, img;
  logicClass objlogic = Get.put(logicClass());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white12,
              Colors.white12,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 300,
                ),
                Image.asset(
                  img,
                  width: 80,
                  height: 80,
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      logo,
                      colorFilter: const ColorFilter.mode(
                          Color(0xff94006f), BlendMode.srcIn),
                      width: 25,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Libramini",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "font4",
                        color: Color(0xffb30086),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ]),
        ),
      ),
    );
  }
}

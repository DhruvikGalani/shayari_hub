import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shayari_app/logicClass.dart';
import 'package:shayari_app/speshScreen.dart';
import 'package:shayari_app/try.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized().obs;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DraggableTextDemo(),
      home: Splesh(),
      // home: tryclass(),
      // home: TryClass(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    objlogic.initMethod();
  }

  logicClass objlogic = Get.put(logicClass());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Shayari HUB",
          style: TextStyle(
            fontFamily: "aclonica",
            shadows: [
              Shadow(
                color: Colors.red,
                blurRadius: 6,
                offset: Offset(1.9, 2),
              ),
              Shadow(
                color: Colors.white70,
                blurRadius: 2,
                offset: Offset(1.4, 1.4),
              ),
            ],
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        elevation: 10,
        backgroundColor: Colors.red.shade200.withOpacity(.50),
        shadowColor: Colors.red.shade400.withOpacity(.7),
        shape: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade50.withOpacity(.70),
              Colors.red.shade200.withOpacity(.40),
              Colors.red.shade300.withOpacity(.55)
            ],
          ),
        ),
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20, left: 7, right: 7),
            physics: const BouncingScrollPhysics(),
            itemCount: objlogic.imglist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: listviewMethod(index),
              );
            },
          ),
        ),
      ),
    );
  }

  InkWell listviewMethod(int index) {
    return InkWell(
      onTap: () {
        objlogic.taponPointerUp(index, context);
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.red.shade100,
            Colors.red.shade100.withOpacity(.87),
            Colors.red.shade100
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.red.shade200.withOpacity(.45),
                offset: const Offset(2.2, 2.2),
                blurRadius: 5,
                spreadRadius: .03),
            BoxShadow(
                color: Colors.red.shade200.withOpacity(.45),
                offset: const Offset(-2.2, -2.2),
                blurRadius: 5,
                spreadRadius: .03),
          ],
          // color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black, width: .7),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(objlogic.imglist[index]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(objlogic.headinglist[index],
                  style: const TextStyle(
                    fontFamily: "nuosuSil",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import 'logicClass.dart';

class Editpage extends StatefulWidget {
  int ind, index;

  Editpage({super.key, required this.ind, required this.index});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  bool b1 = false;
  bool b2 = false;
  bool b3 = false;
  bool b4 = false;
  bool b5 = false;
  bool b6 = false;
  bool b7 = false;
  bool b8 = false;
  Offset _offset = Offset(1, 1);
  String text = "";
  TextEditingController t = TextEditingController();

  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;
  logicClass objlogic = Get.put(logicClass());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    objlogic.initMethod();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                String currentdate =
                    DateFormat("yyyyMMddhhmmss").format(DateTime.now());
                bytes = await controller.capture();
                final tempdirectory = await getTemporaryDirectory();
                File file =
                    await File('${tempdirectory.path}/img$currentdate.jpg')
                        .create();
                file.writeAsBytesSync(bytes!);
                // print(file.path);
                await GallerySaver.saveImage(file.path);
                //share
                final result = await Share.shareXFiles([XFile(file.path)],
                    text: 'From Shayari HUB');
              },
              icon: Icon(
                Icons.offline_share,
                color: Colors.black87,
                size: 26,
                shadows: [
                  Shadow(
                    color: Colors.red.shade900,
                    blurRadius: 9,
                    offset: const Offset(1, 0),
                  ),
                  const Shadow(
                    color: Colors.white70,
                    blurRadius: 2,
                    offset: Offset(1.5, 0),
                  ),
                ],
              )),
        ],
        leading: Center(
          child: IconButton(
              onPressed: () {
                setState(() {
                  objlogic.initMethod();
                  objlogic.navigetorPop(context);
                });
              },
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              splashRadius: 30,
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.black,
                size: 25,
                shadows: [
                  Shadow(
                    color: Colors.red.shade900,
                    blurRadius: 8,
                    offset: const Offset(1, 0),
                  ),
                  const Shadow(
                    color: Colors.white70,
                    blurRadius: 2,
                    offset: Offset(1.5, 0),
                  ),
                ],
              )),
        ),
        centerTitle: true,
        title: const Text("Edit Shayari",
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
                fontSize: 20)),
        foregroundColor: Colors.black54,
        elevation: 10,
        backgroundColor: Colors.red.shade200.withOpacity(.50),
        shadowColor: Colors.red.shade400.withOpacity(.7),
        shape: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      body: Stack(children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.shade50.withOpacity(.70),
                Colors.red.shade200.withOpacity(.40),
                Colors.red.shade300.withOpacity(.55)
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: const SizedBox(
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: WidgetsToImage(
                controller: controller,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: TextField(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 5, right: 5)),
                                  controller: t,
                                  onSubmitted: (value) {
                                    Navigator.pop(context);
                                  },
                                  onChanged: (value) {
                                    text = t.text;
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Obx(
                          () => Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 300,
                            decoration: BoxDecoration(
                              color: (objlogic.colortype.value == "start")
                                  ? Colors.red.shade100
                                  : (objlogic.colortype.value == "single")
                                      ? objlogic.bgcolor.value
                                      : null,
                              boxShadow: [
                                BoxShadow(
                                  color: objlogic.shadowscolor?.value ??
                                      Colors.red.shade200,
                                  offset: const Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                              gradient: (objlogic.colortype.value == "multi")
                                  ? LinearGradient(
                                      colors: objlogic.grcolor!.value)
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Obx(
                                () => Text(
                                  "${objlogic.shayarilist[widget.ind][widget.index]} \n\n ${(objlogic.currentemogi.value != "No Emojis (Default)") ? objlogic.currentemogi.value : ""}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: objlogic.currenfont.value,
                                    fontSize: objlogic.fontsize.value,
                                    color: objlogic.fontcolor.value,
                                    height: 1.4,
                                    wordSpacing: 3,
                                    letterSpacing: .6,
                                    fontWeight: objlogic.fweight.value,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: _offset.dx,
                        top: _offset.dy,
                        child: GestureDetector(
                          onPanUpdate: (DragUpdateDetails details) {
                            setState(() {
                              _offset += Offset(details.delta.dx,
                                  details.delta.dy); // Apply small increment
                            });
                          },
                          child: Text(
                            "${text}",
                            style: TextStyle(
                              color: objlogic.fontcolor.value,
                              fontFamily: objlogic.currenfont.value,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 30,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Listener(
                      onPointerDown: (event) {
                        b1 = true;
                        setState(() {});
                      },
                      onPointerUp: (event) {
                        setState(() {
                          b1 = false;

                          showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context, setState1) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: objlogic.bgcolor.value,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        AlertDialog(
                                          actions: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Obx(
                                                  () => Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: objlogic
                                                          .bgcolor.value,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                              ],
                                            ),
                                          ],
                                          title: Text("Pick a color"),
                                          content: SingleChildScrollView(
                                              child: RGBPicker(
                                            color: objlogic.bgcolor.value,
                                            onChanged: (value) {
                                              setState1(() {
                                                objlogic.colortype.value =
                                                    "single";
                                                objlogic.bgcolor.value = value;
                                              });
                                            },
                                          )),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 140),
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: (b1 == false)
                            ? BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.red.shade300.withOpacity(.85),
                                      blurRadius: 5,
                                      spreadRadius: .3,
                                      offset: const Offset(-3, 3)),
                                ],
                                gradient: LinearGradient(colors: [
                                  Colors.red.shade200.withOpacity(.58),
                                  Colors.red.shade100,
                                ]),
                                borderRadius: BorderRadius.circular(20),
                              )
                            : BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.red.shade200.withOpacity(.35),
                                  Colors.red.shade200.withOpacity(.58),
                                  Colors.red.shade200
                                ]),
                                borderRadius: BorderRadius.circular(20),
                              ),
                        child: const Text(
                          "BG color",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "abeezee",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Listener(
                      onPointerDown: (event) {
                        b2 = true;
                        setState(() {});
                      },
                      onPointerUp: (event) {
                        b2 = false;
                        setState(() {
                          objlogic.colortype.value = "multi";

                          showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (context, setState1) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors:
                                                      objlogic.grcolor!.value),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        AlertDialog(
                                          actions: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState1(() {
                                                      objlogic.indexColor = 1;
                                                      objlogic.color =
                                                          objlogic.color1;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        color: objlogic.color1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState1(() {
                                                      objlogic.indexColor = 2;
                                                      objlogic.color =
                                                          objlogic.color2;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        color: objlogic.color2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                              ],
                                            ),
                                          ],
                                          title: Text("Pick a color"),
                                          content: SingleChildScrollView(
                                              child: RGBPicker(
                                            color: objlogic.color,
                                            onChanged: (value) {
                                              objlogic.color = value;
                                              setState1(() {
                                                if (objlogic.indexColor == 1) {
                                                  objlogic.color1 = value;
                                                  objlogic.grcolor!.value = [
                                                    objlogic.color1,
                                                    objlogic.color2
                                                  ];
                                                } else {
                                                  objlogic.color2 = value;
                                                  objlogic.grcolor!.value = [
                                                    objlogic.color1,
                                                    objlogic.color2
                                                  ];
                                                }
                                              });
                                            },
                                          )),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 140),
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: (b2 == false)
                            ? BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.red.shade300.withOpacity(.85),
                                      blurRadius: 5,
                                      spreadRadius: .3,
                                      offset: const Offset(-3, 3)),
                                ],
                                gradient: LinearGradient(colors: [
                                  Colors.red.shade200.withOpacity(.58),
                                  Colors.red.shade100,
                                ]),
                                borderRadius: BorderRadius.circular(20),
                              )
                            : BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.red.shade200.withOpacity(.35),
                                  Colors.red.shade200.withOpacity(.58),
                                  Colors.red.shade200
                                ]),
                                borderRadius: BorderRadius.circular(20),
                              ),
                        child: const Text(
                          "BG Gradient",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "abeezee",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Listener(
                      onPointerDown: (event) {
                        b3 = true;
                        setState(() {});
                      },
                      onPointerUp: (event) {
                        b3 = false;
                        setState(() {
                          showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context, setState1) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Obx(
                                          () => Container(
                                            height: 50,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: (objlogic
                                                          .colortype.value ==
                                                      "start")
                                                  ? Colors.red.shade100
                                                  : (objlogic.colortype.value ==
                                                          "single")
                                                      ? objlogic.bgcolor.value
                                                      : null,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: objlogic.shadowscolor
                                                          ?.value ??
                                                      Colors.red.shade200,
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 5,
                                                  spreadRadius: 2,
                                                )
                                              ],
                                              gradient:
                                                  (objlogic.colortype.value ==
                                                          "multi")
                                                      ? LinearGradient(
                                                          colors: objlogic
                                                              .grcolor!.value)
                                                      : null,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        AlertDialog(
                                          actions: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Obx(
                                                  () => Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: objlogic
                                                          .shadowscolor!.value,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                              ],
                                            ),
                                          ],
                                          title: Text("Pick a color"),
                                          content: SingleChildScrollView(
                                              child: RGBPicker(
                                            color: objlogic.shadowscolor!.value,
                                            onChanged: (value) {
                                              setState1(() {
                                                objlogic.shadowscolor!.value =
                                                    value;
                                              });
                                            },
                                          )),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 140),
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: (b3 == false)
                            ? BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.red.shade300.withOpacity(.85),
                                      blurRadius: 5,
                                      spreadRadius: .3,
                                      offset: const Offset(-3, 3)),
                                ],
                                gradient: LinearGradient(colors: [
                                  Colors.red.shade200.withOpacity(.58),
                                  Colors.red.shade100,
                                ]),
                                borderRadius: BorderRadius.circular(20),
                              )
                            : BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.red.shade200.withOpacity(.35),
                                  Colors.red.shade200.withOpacity(.58),
                                  Colors.red.shade200
                                ]),
                                borderRadius: BorderRadius.circular(20),
                              ),
                        child: const Text(
                          "BG Shadow",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "abeezee",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10, top: 8, bottom: 8),
                child: Listener(
                  onPointerDown: (event) {
                    b4 = true;
                    setState(() {});
                  },
                  onPointerUp: (event) {
                    b4 = false;
                    setState(() {
                      showModalBottomSheet(
                        context: context,
                        elevation: 6,
                        isDismissible: false,
                        showDragHandle: true,
                        backgroundColor: Colors.white70,
                        constraints: const BoxConstraints(
                            minHeight: 550, maxWidth: double.maxFinite),
                        shape: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(50)),
                            borderSide: BorderSide.none),
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              setState(() {});
                              return Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50)),
                                ),
                                height: double.maxFinite,
                                width: double.maxFinite,
                                child: fontstyle_fun(),
                              );
                            },
                          );
                        },
                      );
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 140),
                    height: 50,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: (b4 == false)
                        ? BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.red.shade300.withOpacity(.85),
                                  blurRadius: 5,
                                  spreadRadius: .3,
                                  offset: const Offset(-3, 3)),
                            ],
                            gradient: LinearGradient(colors: [
                              Colors.red.shade200.withOpacity(.58),
                              Colors.red.shade100,
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          )
                        : BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.red.shade200.withOpacity(.35),
                              Colors.red.shade200.withOpacity(.58),
                              Colors.red.shade200
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                    child: const Text(
                      "Font Style",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "abeezee",
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 8, bottom: 8),
                      child: Listener(
                        onPointerDown: (event) {
                          b5 = true;
                          setState(() {});
                        },
                        onPointerUp: (event) {
                          b5 = false;
                          setState(() {
                            showCupertinoDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context, setState1) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Obx(
                                            () => Container(
                                              height: 50,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: (objlogic
                                                            .colortype.value ==
                                                        "start")
                                                    ? Colors.red.shade100
                                                    : (objlogic.colortype
                                                                .value ==
                                                            "single")
                                                        ? objlogic.bgcolor.value
                                                        : null,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: objlogic.shadowscolor
                                                            ?.value ??
                                                        Colors.red.shade200,
                                                    offset: const Offset(1, 1),
                                                    blurRadius: 5,
                                                    spreadRadius: 2,
                                                  )
                                                ],
                                                gradient:
                                                    (objlogic.colortype.value ==
                                                            "multi")
                                                        ? LinearGradient(
                                                            colors: objlogic
                                                                .grcolor!.value)
                                                        : null,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Aa",
                                                style: TextStyle(
                                                    color: objlogic
                                                        .fontcolor.value,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ),
                                          ),
                                          AlertDialog(
                                            actions: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Obx(
                                                    () => Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: objlogic
                                                            .fontcolor.value,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Cancel"),
                                                  ),
                                                ],
                                              ),
                                            ],
                                            title: Text("Pick a color"),
                                            content: SingleChildScrollView(
                                                child: RGBPicker(
                                              color: objlogic.fontcolor.value,
                                              onChanged: (value) {
                                                setState1(() {
                                                  objlogic.fontcolor.value =
                                                      value;
                                                });
                                              },
                                            )),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: (b5 == false)
                              ? BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.red.shade300
                                            .withOpacity(.85),
                                        blurRadius: 5,
                                        spreadRadius: .3,
                                        offset: const Offset(-3, 3)),
                                  ],
                                  gradient: LinearGradient(colors: [
                                    Colors.red.shade200.withOpacity(.58),
                                    Colors.red.shade100,
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                )
                              : BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.red.shade200.withOpacity(.35),
                                    Colors.red.shade200.withOpacity(.58),
                                    Colors.red.shade200
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                          child: const Text(
                            "Font Color",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "abeezee",
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 8, bottom: 8),
                      child: Listener(
                        onPointerDown: (event) {
                          b6 = true;
                          setState(() {});
                        },
                        onPointerUp: (event) {
                          b6 = false;

                          setState(() {
                            showModalBottomSheet(
                              context: context,
                              elevation: 6,
                              isDismissible: false,
                              showDragHandle: true,
                              backgroundColor: Colors.white70,
                              constraints: const BoxConstraints(
                                  minHeight: 550, maxWidth: double.maxFinite),
                              shape: const OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50)),
                                  borderSide: BorderSide.none),
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    setState(() {});
                                    return Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(50)),
                                      ),
                                      height: double.maxFinite,
                                      width: double.maxFinite,
                                      child: fontWeight_fun(),
                                    );
                                  },
                                );
                              },
                            );
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: (b6 == false)
                              ? BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.red.shade300
                                            .withOpacity(.85),
                                        blurRadius: 5,
                                        spreadRadius: .3,
                                        offset: const Offset(-3, 3)),
                                  ],
                                  gradient: LinearGradient(colors: [
                                    Colors.red.shade200.withOpacity(.58),
                                    Colors.red.shade100,
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                )
                              : BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.red.shade200.withOpacity(.35),
                                    Colors.red.shade200.withOpacity(.58),
                                    Colors.red.shade200
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                          child: const Text(
                            "Font Weight ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "abeezee",
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 8, bottom: 8),
                      child: Listener(
                        onPointerDown: (event) {
                          b7 = true;
                          setState(() {});
                        },
                        onPointerUp: (event) {
                          b7 = false;
                          setState(() {
                            showModalBottomSheet(
                              context: context,
                              elevation: 6,
                              isDismissible: false,
                              showDragHandle: true,
                              backgroundColor: Colors.white70,
                              constraints: const BoxConstraints(
                                  minHeight: 110, maxWidth: double.maxFinite),
                              shape: const OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50)),
                                  borderSide: BorderSide.none),
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState1) {
                                    return Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(50)),
                                      ),
                                      height: 90,
                                      width: double.maxFinite,
                                      child: CupertinoSlider(
                                        value: objlogic.fontsize.value,
                                        onChanged: (value) {
                                          setState(() {
                                            setState1(() {
                                              objlogic.fontsize.value = value;
                                            });
                                          });
                                        },
                                        max: 30,
                                        min: 10,
                                        // overlayColor: MaterialStatePropertyAll(Colors.red.shade100),
                                        // label: "FontSize",
                                        activeColor: Colors.red.shade300,
                                        thumbColor: Colors.red.shade100,

                                        // inactiveColor: Colors.black12,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: (b7 == false)
                              ? BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.red.shade300
                                            .withOpacity(.85),
                                        blurRadius: 5,
                                        spreadRadius: .3,
                                        offset: const Offset(-3, 3)),
                                  ],
                                  gradient: LinearGradient(colors: [
                                    Colors.red.shade200.withOpacity(.58),
                                    Colors.red.shade100,
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                )
                              : BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.red.shade200.withOpacity(.35),
                                    Colors.red.shade200.withOpacity(.58),
                                    Colors.red.shade200
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                          child: const Text(
                            "Font Size",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "abeezee",
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 8, bottom: 8),
                      child: Listener(
                        onPointerDown: (event) {
                          b8 = true;
                          setState(() {});
                        },
                        onPointerUp: (event) {
                          b8 = false;

                          setState(() {
                            showModalBottomSheet(
                              context: context,
                              elevation: 6,
                              isDismissible: false,
                              showDragHandle: true,
                              backgroundColor: Colors.white70,
                              constraints: const BoxConstraints(
                                  minHeight: 550, maxWidth: double.maxFinite),
                              shape: const OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50)),
                                  borderSide: BorderSide.none),
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    setState(() {});
                                    return Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(50)),
                                      ),
                                      height: double.maxFinite,
                                      width: double.maxFinite,
                                      child: Emoji_fun(),
                                    );
                                  },
                                );
                              },
                            );
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: (b8 == false)
                              ? BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.red.shade300
                                            .withOpacity(.85),
                                        blurRadius: 5,
                                        spreadRadius: .3,
                                        offset: const Offset(-3, 3)),
                                  ],
                                  gradient: LinearGradient(colors: [
                                    Colors.red.shade200.withOpacity(.58),
                                    Colors.red.shade100,
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                )
                              : BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.red.shade200.withOpacity(.35),
                                    Colors.red.shade200.withOpacity(.58),
                                    Colors.red.shade200
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                          child: const Text(
                            "Emojis",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "abeezee",
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ]),
    );
  }

  Widget fontWeight_fun() {
    return Container(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Font Weight",
              style: TextStyle(
                fontFamily: "Hahmlet-Bold",
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: objlogic.fontweight.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      objlogic.changeFontWeight(index, context);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade400),
                      child: Text(
                        objlogic.fwname[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "f1",
                          fontSize: 20,
                          fontWeight: objlogic.fontweight[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget fontstyle_fun() {
    return Container(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Font Styles",
              style: TextStyle(
                fontFamily: "Hahmlet-Bold",
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: objlogic.fontstyle.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {});
                    objlogic.changefontstyle(index, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade400),
                      child: Text(
                        "Shayari HUB ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: objlogic.fontstyle[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget Emoji_fun() {
    return Container(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Emojis",
              style: TextStyle(
                fontFamily: "Hahmlet-Bold",
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: objlogic.emojilist.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      objlogic.changeemoji(index, context);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade400),
                      child: Text(
                        objlogic.emojilist[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize:
                                20), //charisSil nuosuSil eagleLake jacquesFrancois
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

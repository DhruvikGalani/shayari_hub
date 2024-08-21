import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:get/get.dart';
import 'package:shayari_app/TextEdit.dart';

import 'logicClass.dart';

class ThirdPage extends StatefulWidget {
  int ind, index2;

  ThirdPage({super.key, required this.ind, required this.index2});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late int ind;
  late int index;
  bool c1 = false;
  bool c2 = false;
  bool tapbgcolor = false;
  bool tapgcolor = false;
  bool tapshadowcolor = false;
  PageController? pageControl;
  logicClass objlogic = Get.put(logicClass());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    objlogic.initMethod();
    ind = widget.ind;
    // if here widget not aplly then give stack overflow
    // if here widget not aplly then give stack overflow
    if (widget.index2 == 0) {
      i1 = true;
    } else {
      i1 = false;
    }
    if (widget.index2 == (objlogic.shayarilist[ind].length - 1)) {
      i2 = true;
    } else {
      i2 = false;
    }

    pageControl = PageController(initialPage: widget.index2);
    pageControl!.addListener(() {
      setState(() {
        widget.index2 = pageControl!.page!.toInt();
      });
    });
  }

  bool i1 = false;
  bool i2 = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
              onPressed: () {
                objlogic.initMethod();
                objlogic.navigetorPop(context);
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
        title: Obx(
          () => Text(objlogic.headinglist[ind],
              style: const TextStyle(
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
        ),
        foregroundColor: Colors.black54,
        elevation: 10,
        backgroundColor: Colors.red.shade200.withOpacity(.50),
        shadowColor: Colors.red.shade400.withOpacity(.7),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
              objlogic.sharemethod(widget.ind, widget.index2);
            },
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashRadius: 30,
            icon: Icon(
              CupertinoIcons.share_up,
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
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        shape: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      body: Stack(
        children: [
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
          Positioned(
            right: .0,
            top: 13,
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 8),
              child: Obx(
                () => Text(
                  "${widget.index2 + 1}/${objlogic.shayarilist[ind].length}",
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontFamily: "abeezee",
                    //wallpoet nanumGothic  gaegu
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    fontSize: 15,
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
                  ),
                ),
              ),
            ),
          ),
          ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: Obx(
              () => PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: objlogic.shayarilist[ind].length,
                controller: pageControl,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: 330,
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
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {});
                                        objlogic
                                            .copytextMethod(ind, index)
                                            .then((value) {
                                          var snackBar = SnackBar(
                                              content: Text(
                                            'copied',
                                            textAlign: TextAlign.center,
                                          ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        });
                                      },
                                      splashRadius: 30,
                                      icon: Icon(
                                        CupertinoIcons.doc_on_clipboard,
                                        // color: Color(0xff24708),
                                        color: Colors.black,
                                        size: 22,
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
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          objlogic.edit.text = "";
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return TextEdit(
                                                  ind: widget.ind,
                                                  index: widget.index2,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          // CupertinoIcons.pencil_slash,
                                          Icons.edit_note_rounded,
                                          color: Colors.black,
                                          // color: Color(0xff24708),
                                          size: 32,
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
                                ),
                                Flexible(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Obx(
                                      () => Text(
                                          // "${objlogic.shayarilist[widget.ind][widget.index]} \n\n ${(objlogic.currentemogi.value != "No Emojis (Default)") ? objlogic.currentemogi.value : ""}",
                                          "${objlogic.shayarilist[ind][index]} \n\n ${(objlogic.currentemogi.value == "No Emojis (Default)") ? "" : objlogic.currentemogi}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: objlogic.fontsize.value,
                                            fontFamily:
                                                objlogic.currenfont.value,
                                            color: objlogic.fontcolor.value,
                                            height: 1.4,
                                            wordSpacing: 3,
                                            letterSpacing: .6,
                                            fontWeight: objlogic.fweight.value,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 140,
            left: 115,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Listener(
                  onPointerDown: (event) {
                    setState(() {
                      c1 = true;
                    });
                  },
                  onPointerUp: (event) {
                    setState(() {
                      c1 = false;
                      if (widget.index2 != 0) {
                        widget.index2 = widget.index2 - 1;
                        pageControl!.jumpToPage(widget.index2);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 172),
                    height: 40,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: (!c1)
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
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(50),
                              right: Radius.circular(20),
                            ),
                          )
                        : BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.red.shade200.withOpacity(.35),
                              Colors.red.shade200.withOpacity(.58),
                              Colors.red.shade200
                            ]),
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(50),
                              right: Radius.circular(20),
                            ),
                          ),
                    child: Icon(
                      CupertinoIcons.chevron_compact_left,
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
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Listener(
                  onPointerUp: (event) {
                    setState(() {
                      c2 = false;
                      if (widget.index2 !=
                          (objlogic.shayarilist[ind].length - 1)) {
                        widget.index2 = widget.index2 + 1;
                        pageControl!.jumpToPage(widget.index2);
                      }
                    });
                  },
                  onPointerDown: (event) {
                    setState(() {
                      c2 = true;
                    });
                  },
                  child: AnimatedContainer(
                    height: 40,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: (!c2)
                        ? BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.red.shade300.withOpacity(.85),
                                  blurRadius: 5,
                                  spreadRadius: .3,
                                  offset: const Offset(3, 3))
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Colors.red.shade100,
                                Colors.red.shade200.withOpacity(.58),
                              ],
                            ),
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(50),
                              left: Radius.circular(20),
                            ),
                          )
                        : BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.red.shade200,
                                Colors.red.shade200.withOpacity(.58),
                                Colors.red.shade200.withOpacity(.35),
                              ],
                            ),
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(50),
                              left: Radius.circular(20),
                            ),
                          ),
                    duration: const Duration(milliseconds: 172),
                    child: Icon(
                      CupertinoIcons.chevron_compact_right,
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            child: Container(
              height: 50,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.red.shade200,
                      blurRadius: 7,
                      offset: const Offset(-3, 3))
                ],
                gradient: LinearGradient(
                  colors: [Colors.red.shade200, Colors.red.shade100],
                ),
              ),
              child: IconButton(
                onPressed: () {
                  setState(
                    () {
                      showModalBottomSheet(
                        context: context,
                        elevation: 6,
                        isDismissible: false,
                        showDragHandle: true,
                        backgroundColor: Colors.white60.withOpacity(.750),
                        constraints: const BoxConstraints(
                            minHeight: 250, maxWidth: double.maxFinite),
                        shape: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(50)),
                            borderSide: BorderSide.none),
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0),
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(50)),
                            ),
                            height: 250,
                            width: double.maxFinite,
                            child: showbutton(),
                          );
                        },
                      );
                    },
                  );
                },
                splashRadius: 20,
                icon: Icon(
                  Icons.color_lens,
                  color: Colors.black87.withOpacity(.78),
                  // color: Color(0xff24708),
                  size: 30,
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
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Container(
              height: 50,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.red.shade200,
                      blurRadius: 7,
                      offset: const Offset(-3, 3))
                ],
                gradient: LinearGradient(
                  colors: [Colors.red.shade200, Colors.red.shade100],
                ),
              ),
              child: IconButton(
                onPressed: () {
                  objlogic.initMethod();
                  objlogic.navigetorEditpage(
                      context, widget.ind, widget.index2);
                },
                icon: Icon(
                  CupertinoIcons.textformat,
                  color: Colors.black87.withOpacity(.78),
                  size: 30,
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showbutton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // bg color button
        Listener(
          onPointerDown: (event) {
            setState(() {});
            tapbgcolor = true;
          },
          onPointerUp: (event) {
            setState(() {
              tapbgcolor = false;

              showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, setState1) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Container(
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: objlogic.bgcolor.value,
                                  borderRadius: BorderRadius.circular(20),
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
                                          color: objlogic.bgcolor.value,
                                          borderRadius:
                                              BorderRadius.circular(100),
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
                                    objlogic.colortype.value = "single";
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
            margin: const EdgeInsets.symmetric(horizontal: 60),
            width: double.maxFinite,
            alignment: Alignment.center,
            decoration: (tapbgcolor == false)
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
              "BG Colour",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "abeezee",
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //gradient color button
        Listener(
          onPointerDown: (event) {
            tapgcolor = true;
            setState(() {});
          },
          onPointerUp: (event) {
            setState(() {
              tapgcolor = false;
              setState(() {
                objlogic.colortype.value = "multi";

                showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setState1) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: objlogic.grcolor!.value),
                                    borderRadius: BorderRadius.circular(20)),
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
                                            objlogic.color = objlogic.color1;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: objlogic.color1,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState1(() {
                                            objlogic.indexColor = 2;
                                            objlogic.color = objlogic.color2;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: objlogic.color2,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
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
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 60),
            width: double.maxFinite,
            alignment: Alignment.center,
            decoration: (tapgcolor == false)
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
              "Gradient Colour",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "abeezee",
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //shadow color button
        Listener(
          onPointerDown: (event) {
            setState(() {
              tapshadowcolor = true;
            });
          },
          onPointerUp: (event) {
            setState(() {
              tapshadowcolor = false;
              showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, setState1) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Container(
                                height: 50,
                                width: 90,
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
                                  gradient:
                                      (objlogic.colortype.value == "multi")
                                          ? LinearGradient(
                                              colors: objlogic.grcolor!.value)
                                          : null,
                                  borderRadius: BorderRadius.circular(20),
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
                                          color: objlogic.shadowscolor!.value,
                                          borderRadius:
                                              BorderRadius.circular(100),
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
                                    objlogic.shadowscolor!.value = value;
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
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 60),
            alignment: Alignment.center,
            decoration: (tapshadowcolor == false)
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
              "shadow Colour",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "abeezee",
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}

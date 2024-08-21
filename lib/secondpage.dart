import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

import 'logicClass.dart';

class SecondPage extends StatefulWidget {
  int index;

  SecondPage({super.key, required this.index}); // key added

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late int ind;
  late List<String> curlist;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    objlogic.initMethod();
    ind = widget.index;
    curlist = [];
    curlist = objlogic.shayarilist.value[ind];
  }

  logicClass objlogic = Get.put(logicClass());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              objlogic.lengthalertBox(context, ind);
            },
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Obx(
              () => Container(
                height: 32,
                width: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(objlogic.imglist[ind]),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 35,
          ),
        ],
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
        title: Obx(() => Text(
              objlogic.headinglist[ind],
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
                  fontSize: 20),
            )),
        foregroundColor: Colors.black54,
        elevation: 10,
        backgroundColor: Colors.red.shade200.withOpacity(.50),
        shadowColor: Colors.red.shade400.withOpacity(.7),
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
                gradient: LinearGradient(colors: [
              Colors.red.shade50,
              Colors.red.shade100.withOpacity(.87),
              Colors.red.shade200.withOpacity(.7),
              Colors.red.shade200.withOpacity(.9),
            ])),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFCarousel(
                  items: curlist.map(
                    (url) {
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(7),
                        height: 180,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          border: Border.all(
                            color: Colors.red.shade200.withOpacity(.60),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Text(
                            url,
                            style: const TextStyle(
                              fontFamily: "nuosuSil",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .6,
                              wordSpacing: 2.5,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            // textDirection: TextDirection.ltr,
                            maxLines: 4,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  autoPlay: true,
                  activeIndicator: Colors.black,
                  activeDotBorder: Border.all(color: Colors.black45),
                  autoPlayCurve: Curves.easeInQuint,
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: Duration(milliseconds: 2200),
                  onPageChanged: (index) {
                    setState(() {
                      index;
                    });
                  },
                ),
              ),
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20, left: 7, right: 7),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: objlogic.shayarilist[ind].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          objlogic.movethirdPage(context, ind, index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          height: 80,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            border: Border.all(
                              color: Colors.red.shade200.withOpacity(.60),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      objlogic.shayarilist[ind][index],
                                      style: const TextStyle(
                                        fontFamily: "nuosuSil",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: .6,
                                        wordSpacing: 2.5,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.ltr,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                                title: Text("Delete Shaayari"),
                                                actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                  child: Text("Cancel")),
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      objlogic.shayarilist[ind]
                                                          .removeAt(index);
                                                      // objlogic.shayarilist[ind]
                                                      //     .addAll(objlogic
                                                      //             .shayarilist[
                                                      //         ind]);
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Delete")),
                                            ]),
                                      );
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      CupertinoIcons.delete,
                                    )),
                              ],
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
        ],
      ),
    );
  }
}

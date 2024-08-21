import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayari_app/logicClass.dart';
import 'package:shayari_app/thirdpage.dart';

class TextEdit extends StatefulWidget {
  int ind, index;
  TextEdit({required this.ind, required this.index});

  @override
  State<TextEdit> createState() => _TextEditState();
}

logicClass objlogic = Get.put(logicClass());

class _TextEditState extends State<TextEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return ThirdPage(ind: widget.ind, index2: widget.index);
                  },
                ));
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
          () => Text(objlogic.headinglist[widget.ind],
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
        shape: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      body: Center(
        child: Stack(children: [
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
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: double.maxFinite,
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
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      objlogic
                                          .copytextMethod(
                                              widget.ind, widget.index)
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
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Obx(
                                  () => Text(
                                      "${objlogic.shayarilist[widget.ind][widget.index]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: objlogic.fontsize.value,
                                        fontFamily: objlogic.currenfont.value,
                                        color: objlogic.fontcolor.value,
                                        height: 1.4,
                                        wordSpacing: 3,
                                        letterSpacing: .6,
                                        fontWeight: objlogic.fweight.value,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          onChanged: (value) {
                            objlogic.shayarilist[widget.ind][widget.index] =
                                objlogic.edit.text;
                            setState(() {});
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: objlogic.edit,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

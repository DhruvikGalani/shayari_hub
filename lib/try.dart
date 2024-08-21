// for gradient color picker

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
//
// class tryclass extends StatefulWidget {
//   const tryclass({super.key});
//
//   @override
//   State<tryclass> createState() => _tryclassState();
// }
//
// class _tryclassState extends State<tryclass> {
//   @override
//   int index = 1;
//   Color color1 = Colors.red;
//   Color color2 = Colors.yellow;
//   Color color = Colors.red;
//
//   List<Color> gcolor = [Colors.red, Colors.yellow];
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: InkWell(
//           onTap: () {
//             setState(() {
//               showCupertinoDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return StatefulBuilder(
//                       builder: (context, setState1) {
//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 50,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                   gradient: LinearGradient(colors: gcolor),
//                                   borderRadius: BorderRadius.circular(15)),
//                             ),
//                             AlertDialog(
//                               actions: [
//                                 Row(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         setState1(() {
//                                           index = 1;
//                                           color = color1;
//                                         });
//                                       },
//                                       child: Container(
//                                         height: 30,
//                                         width: 30,
//                                         decoration: BoxDecoration(
//                                             color: color1,
//                                             borderRadius:
//                                                 BorderRadius.circular(50)),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 14,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         setState1(() {
//                                           index = 2;
//                                           color = color2;
//                                         });
//                                       },
//                                       child: Container(
//                                         height: 30,
//                                         width: 30,
//                                         decoration: BoxDecoration(
//                                             color: color2,
//                                             borderRadius:
//                                                 BorderRadius.circular(50)),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 6,
//                                     ),
//                                     Spacer(),
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: Text("Cancel"),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         setState1(() {
//                                           List<Color> l = [color1, color2];
//                                           gcolor = l;
//                                         });
//                                         Navigator.pop(context);
//                                       },
//                                       child: Text("Done"),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                               title: Text("Pick a color"),
//                               content: SingleChildScrollView(
//                                   child: RGBPicker(
//                                 color: color,
//                                 onChanged: (value) {
//                                   color = value;
//                                   setState1(() {
//                                     if (index == 1) {
//                                       color1 = value;
//                                       gcolor = [color1, color2];
//                                     } else {
//                                       color2 = value;
//                                       gcolor = [color1, color2];
//                                     }
//                                   });
//                                 },
//                               )),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   });
//             });
//           },
//           child: Container(
//             height: 50,
//             margin: const EdgeInsets.symmetric(horizontal: 60),
//             width: double.maxFinite,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.red.shade300.withOpacity(.85),
//                     blurRadius: 5,
//                     spreadRadius: .3,
//                     offset: const Offset(-3, 3)),
//               ],
//               gradient: LinearGradient(colors: [
//                 Colors.red.shade200.withOpacity(.58),
//                 Colors.red.shade100,
//               ]),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Text(
//               "BG Colour",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontFamily: "abeezee",
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DraggableTextDemo extends StatefulWidget {
  @override
  _DraggableTextDemoState createState() => _DraggableTextDemoState();
}

class _DraggableTextDemoState extends State<DraggableTextDemo> {
  Offset _offset = Offset(1, 1);
  String text = "";
  TextEditingController t = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Text Example'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: TextField(
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
            icon: Icon(Icons.text_fields_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child:
                Container(width: 500, height: 500, color: Colors.red.shade200),
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
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

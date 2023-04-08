import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:post_maker/screen/linkdin_screen/linkdin_modal.dart';

class Linkdinpost extends StatefulWidget {
  const Linkdinpost({Key? key}) : super(key: key);

  @override
  State<Linkdinpost> createState() => _LinkdinpostState();
}

class _LinkdinpostState extends State<Linkdinpost> {
  GlobalKey globalkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Linkdata l = ModalRoute.of(context)!.settings.arguments as Linkdata;
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            colors: [Colors.red.shade900, Colors.red.shade200],
          ))),
          title: Text(
            "Linkdin Post",
            style: GoogleFonts.wallpoet(fontSize: 30, color: Colors.white),
          ),
          actions: [
            PopupMenuButton(
              iconSize: 25,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Save Post"),
                    onTap: () async {
                      RenderRepaintBoundary? rboundry =
                          globalkey.currentContext!.findRenderObject()
                              as RenderRepaintBoundary;
                      var img = await rboundry.toImage();
                      var data =
                          await img.toByteData(format: ImageByteFormat.png);
                      Uint8List uint8list = data!.buffer.asUint8List();

                      await ImageGallerySaver.saveImage(uint8list);
                    },
                  ),
                ];
              },
            )
          ]),
      body: RepaintBoundary(
        key: globalkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.purple.shade100,
                  Colors.pink.shade100,
                ],
              )),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.red.shade700),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            l.img != null
                                ? Container(
                                    width: 130,
                                    height: 130,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.file(File("${l.img}"),
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                : Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset("assets/p.jpg",
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                            SizedBox(
                              width: 150,
                              child: Text("${l.tagline}",
                                  style: GoogleFonts.exo(fontSize: 20,color: Colors.blueGrey)),
                            )
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              color: Colors.red.shade700),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.9, 0),
                    child: Container(
                      height: double.infinity,
                      width: 180,
                      color: Colors.blueGrey.shade700,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${l.name}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 3),
                            Divider(
                                color: Colors.red,
                                thickness: 2,
                                indent: 3,
                                endIndent: 80,
                                height: 2),
                            SizedBox(height: 20),
                            box(
                                title: l.phone,
                                i: Icon(Icons.call,
                                    color: Colors.white, size: 15)),
                            SizedBox(height: 20),
                            box(
                                title: l.email,
                                i: Icon(Icons.email,
                                    color: Colors.white, size: 15)),
                            SizedBox(height: 20),
                            box(
                                title: l.insta,
                                i: Icon(Icons.public,
                                    color: Colors.white, size: 15)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row box({String? title, Icon? i}) {
    return Row(
      children: [
        CircleAvatar(
          child: i,
          radius: 15,
          backgroundColor: Colors.red.shade700,
        ),
        SizedBox(width: 5),
        SizedBox(
            width: 120,
            child: Text(
              "$title",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ))
      ],
    );
  }
}

import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class SimpleData extends StatefulWidget {
  const SimpleData({Key? key}) : super(key: key);

  @override
  State<SimpleData> createState() => _SimpleDataState();
}

class _SimpleDataState extends State<SimpleData> {
  String? path;
  GlobalKey globalkey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
              colors: [Colors.red.shade900, Colors.red.shade200],
            ))),
            title: Text(
              "Simple Post",
              style:GoogleFonts.wallpoet(fontSize: 30, color: Colors.white),
            ), actions: [
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: RepaintBoundary(
            key: globalkey,
            child: Center(
                child: Stack(
              alignment: Alignment(0, 0),
              children: [
                Expanded(
                  child: Image.network(
                      "https://img.freepik.com/free-vector/modern-circle-shape-template-with-image-space_1017-27360.jpg",
                      fit: BoxFit.cover,
                      width: 350,
                      height: 350),
                ),
                InkWell(
                  onTap: () {
                    dialoge();
                  },
                  child: path==null?CircleAvatar(
                    radius: 118,
                    backgroundImage: AssetImage("assets/p.jpg"),
                  ):CircleAvatar(
                    radius: 118,
                    backgroundImage: FileImage(File("$path")),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
  void dialoge() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Take a Photo From"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      ImagePicker img = ImagePicker();
                      XFile? xfile =
                      await img.pickImage(source: ImageSource.camera);
                      setState(() {
                        path = xfile!.path;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(height: 5),
                        Text("Camera"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      ImagePicker img = ImagePicker();
                      XFile? xfile =
                      await img.pickImage(source: ImageSource.gallery);
                      setState(() {
                        path = xfile!.path;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(height: 5),
                        Text("Gallery"),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

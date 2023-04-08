import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_maker/screen/linkdin_screen/linkdin_modal.dart';

class Linkdin_data extends StatefulWidget {
  const Linkdin_data({Key? key}) : super(key: key);

  @override
  State<Linkdin_data> createState() => _Linkdin_dataState();
}

class _Linkdin_dataState extends State<Linkdin_data> {
  String? path;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController insta = TextEditingController();
  TextEditingController tagline = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    dialoge();
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400,
                            width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: path == null
                        ? Icon(Icons.camera_alt,
                        size: 100, color: Colors.blue.shade200)
                        : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File("$path"),
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        prefixIcon:
                        Icon(Icons.person_2_outlined, color: Colors.grey
                            .shade400),
                        hintText: "Full Name",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade400, width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        prefixIcon:
                        Icon(Icons.mail, color: Colors.grey.shade400),
                        hintText: "email",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade400, width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: tagline,
                    decoration: InputDecoration(
                        prefixIcon:
                        Icon(Icons.sell, color: Colors.grey.shade400),
                        hintText: "Tagline....",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade400, width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: insta,
                    decoration: InputDecoration(
                        prefixIcon:
                        Icon(Icons.public, color: Colors.grey.shade400),
                        hintText: "Social media",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade400, width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: number, keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefixIcon:
                        Icon(Icons.call, color: Colors.grey.shade400),
                        hintText: "number",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade400, width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(onPressed: () {
                    Linkdata l=Linkdata(name: name.text,
                        email: email.text,
                        insta: insta.text,
                        phone: number.text,
                        tagline: tagline.text,
                        img: path);
                    Navigator.pushNamed(context, 'link_post',arguments: l);
                  },
                      child: Text("Create",style: TextStyle(color: Colors.white,fontSize: 25)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade700)),
                )
              ],
            ),
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

//   ignore_for_file:   avoid_print

import 'package:azkar/models/section_model.dart';
import 'package:azkar/screen/azkarpage_screen.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<AzkarsectionModel> sections = [];

  @override
  void initState() {
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(93, 76, 60, 1),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 15.0, left: 15.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildSectionItem(model: sections[index]),
            itemCount: sections.length,
          ),
        ),
      ),
    );
  }

  Widget buildSectionItem({required AzkarsectionModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AzkarpageScreen(
                  id: model.id!,
                  title: model.name!,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 43, 37, 15),
                  Color.fromARGB(255, 166, 171, 82),
                  Color.fromARGB(255, 43, 37, 15),
                ])),
        child: Center(
            child: Text(
          "${model.name}",
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/azkarsections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkarsectionModel _section = AzkarsectionModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}

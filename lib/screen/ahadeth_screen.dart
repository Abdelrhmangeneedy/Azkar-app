//   ignore_for_file:   avoid_print

import 'package:azkar/models/ahadethsection_model.dart';
import 'package:azkar/screen/ahadethpage_screen.dart';

import 'package:flutter/material.dart';
import 'dart:convert';

class AhadethScreen extends StatefulWidget {
  const AhadethScreen({Key? key}) : super(key: key);

  @override
  _AhadethScreenState createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<AhadethsectionModel> sections = [];

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
          padding: const EdgeInsets.all(12.0),
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

  Widget buildSectionItem({required AhadethsectionModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AhadethpageScreen(
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
                  Color.fromARGB(255, 43, 27, 15),
                  Color.fromARGB(255, 171, 152, 82),
                  Color.fromARGB(255, 43, 27, 15),
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
        .loadString("assets/database/ahadethsections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AhadethsectionModel _section = AhadethsectionModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}

//   ignore_for_file:   avoid_print

import 'package:azkar/models/section_detail_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AzkarpageScreen extends StatefulWidget {
  final int id;
  final String title;
  const AzkarpageScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _AzkarpageScreenState createState() => _AzkarpageScreenState();
}

class _AzkarpageScreenState extends State<AzkarpageScreen> {
  List<AzkarsectionDetailModel> sectionDetails = [];

  @override
  void initState() {
    super.initState();
    loadSectionDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color.fromARGB(255, 43, 34, 1)),
      backgroundColor: const Color.fromARGB(255, 43, 34, 1),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 252, 228),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 52, 30, 12)
                            .withOpacity(.5),
                        spreadRadius: 8,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: ListTile(
                  title: Text(
                    "${sectionDetails[index].reference}",
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    "${sectionDetails[index].content}",
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color:
                      const Color.fromARGB(255, 255, 231, 218).withOpacity(.8),
                ),
            itemCount: sectionDetails.length),
      ),
    );
  }

  loadSectionDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/azkarsection_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkarsectionDetailModel _sectionDetail =
            AzkarsectionDetailModel.fromJson(section);

        if (_sectionDetail.sectionId == widget.id) {
          sectionDetails.add(_sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}

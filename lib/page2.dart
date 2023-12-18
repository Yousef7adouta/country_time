import 'package:flutter/material.dart';

import 'get_class.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    List allcountry = [
      CountriesGetData(
          countryName: "Egypt/Cairo", flag: "Egypt.png", link: "Africa/Cairo"),
      CountriesGetData(
          countryName: "Morocco/Casablanca",
          flag: "morocco.png",
          link: "Africa/Casablanca"),
      CountriesGetData(
          countryName: "Saidarbia,Macca",
          flag: "said.png",
          link: "Asia/Riyadh"),
      CountriesGetData(
          countryName: "Palstin,Gaza", flag: "palstin.png", link: "Asia/Gaza"),
      CountriesGetData(
          countryName: "Canda,Toronto",
          flag: "canda.png",
          link: "America/Toronto"),
    ];

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 192, 216, 233),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(99, 0, 0, 0),
          title: Text(
            "Choose Country",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        body: ListView.builder(
            itemCount: allcountry.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () async {
                    CountriesGetData Egypt = allcountry[index];
                    await Egypt.getdata();
                    Navigator.pop(context, {
                      "time": Egypt.NowReal,
                      "location": Egypt.Location,
                      "day": Egypt.Day
                    });
                  },
                  title: Text(
                    allcountry[index].countryName,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${allcountry[index].flag}"),
                  ),
                ),
              );
            }));
  }
}

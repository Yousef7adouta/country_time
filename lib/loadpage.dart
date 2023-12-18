import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'get_class.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  
  CountriesGetData country = CountriesGetData(countryName:"Egypt/Cairo",flag: "Egypt.png",link: "Africa/Cairo");

  GetdataLoading() async {
     await country.getdata();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": country.NowReal,
      "location": country.Location,
      "day": country.Day
    });
  }

  @override
  void initState() {
    super.initState();
    GetdataLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(155, 209, 197, 250),
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Color.fromARGB(255, 86, 200, 230),
          size: 95.0,
        ),
      ),
    );
  }
}

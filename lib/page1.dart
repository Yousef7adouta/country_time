import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  //Map time = {"country": "Egypt", "CurrentTime": "10:20"};

  Map data = {};

  @override
  Widget build(BuildContext context) {
    //    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    
    String imag = data["day"] ? "evining.jpg" : "morning.jpg";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$imag"), fit: BoxFit.cover),
            color: Color.fromARGB(155, 209, 197, 250)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/second');
                  print(result);
                  setState(() {
                    if (result == null) {
                      data = {
                        "time": "--:--",
                        "location": "Please Entr Your Country",
                        "day": true
                      };
                    } else {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "day": result["day"]
                      };
                    }
                  });
                },
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Color.fromARGB(255, 235, 3, 3),
                  size: 25,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(40, 135, 7, 255)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
              ),
              SizedBox(
                height: 250,
              ),
              Container(
                color: Color.fromARGB(120, 0, 0, 0),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 0),
                child: Column(
                  children: [
                    Text(
                      data["time"],
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      data["location"],
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

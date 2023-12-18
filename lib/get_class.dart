import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CountriesGetData {
  final String countryName;
  final String flag;
  final String link;
  CountriesGetData({
required this.countryName,
required this.flag,
required this.link
  });

  late bool Day;
  late String NowReal;
  late String Location;
  // String CountryLink="http://worldtimeapi.org/api/timezone/Africa/Cairo" ;
/*   CountriesGetData({required this.CountryLink});
 */
  getdata() async {
    try {
      Response recivedData = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
      Map Data = jsonDecode(recivedData.body);
      String DateNow = Data["utc_datetime"];
      DateTime TimeReal = DateTime.parse(DateNow);
      int offset = int.parse(Data["utc_offset"].substring(0, 3));
      DateTime NowTime = TimeReal.add(Duration(hours: offset));
      Location = Data["timezone"];
      NowReal = DateFormat('hh:mm a').format(NowTime);

      if (NowTime.hour <18 && NowTime.hour > 4) {
        Day = false;
      } else {
        Day = true;
      }

      
    } catch (e) {
      print(e);
    }
  }
}

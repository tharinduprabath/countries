import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forum/model/country.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Country> _countryList = [];

  final formatter = new NumberFormat("#,###");

  final double boxHeight = 20;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Widget singleView(){
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlue],
        begin: Alignment.bottomCenter,end: Alignment.topCenter))
          ),
          ],
    );
  }


  Future<List<Country>> _getData() async {
    var name = "Sri Lanka";
    var url = "https://restcountries-v1.p.rapidapi.com/all";
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "X-RapidAPI-Host": "restcountries-v1.p.rapidapi.com",
        "X-RapidAPI-Key": "d65ef43d4emshe8060a09b776bb1p1dd849jsn8818a6ba407f"
      },
    );

    var jsonData = json.decode(response.body);

    for (var c in jsonData) {
      Country country = Country.fromJsonMap(c);
      _countryList.add(country);
    }

    return _countryList;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: FutureBuilder(
                future: _getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Container(
                        width: 35,
                        height: 35,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemExtent: 640,
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical:
                      50),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.elliptical(10, 10),bottom:
                                Radius.elliptical(15, 15))),
                            elevation: 5,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ListTile(
                                  title: Text(snapshot.data[index].name),
                                  subtitle: Text(snapshot.data[index]
                                      .capital+" / "+snapshot.data[index].region),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.elliptical(10, 10),bottom:
                                  Radius.elliptical(15, 15)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    width: MediaQuery.of(context).size.width *
                                        95/
                                        100,
                                    color: Theme.of(context).primaryColor,
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Alpha Code 3",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          (snapshot.data[index].alpha3Code !=
                                              null)
                                              ?snapshot.data[index].alpha3Code:"",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Alpha Code 2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          (snapshot.data[index].alpha2Code != null)
                                              ?snapshot.data[index].alpha2Code:"",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Sub Region",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          (snapshot.data[index].subregion != null)
                                              ?snapshot.data[index].subregion:"",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Population",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          formatter
                                              .format(
                                              (snapshot.data[index].population
                                                  != null)
                                                  ?snapshot.data[index]
                                                  .population:0)
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Demonym",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          (snapshot.data[index].demonym != null)
                                              ?snapshot.data[index].demonym:"",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Area",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          formatter
                                              .format((snapshot.data[index]
                                              .area != null)?snapshot
                                              .data[index].area:0)
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Gini",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          (snapshot.data[index].gini != null)
                                              ?snapshot
                                              .data[index].gini.toString():"",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Native Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          (snapshot.data[index].nativeName != null)
                                              ?snapshot.data[index].nativeName:"",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Numeric Code",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          (snapshot.data[index].numericCode != null)
                                              ?snapshot.data[index].numericCode:"",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: boxHeight,
                                        ),
                                        Text(
                                          "Relevance",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                        Text(
                                          (snapshot.data[index].relevance != null)
                                              ?snapshot.data[index].relevance:"",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                })
        )
    );
  }
}

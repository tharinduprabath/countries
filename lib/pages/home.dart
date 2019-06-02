import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forum/model/country.dart';
import 'package:forum/model/ItemCard.dart';
import 'SingleViewDialog.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Country> _countryList = [];

  String region = "all";

  final formatter = new NumberFormat("#,###");
  final double boxHeight = 20;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Widget _getItemCard(ItemCard itemCard, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) =>
                new SingleViewDialog(itemCard: itemCard)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'hero' + itemCard.alpha3Code,
                child: Container(
                  height: 75,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [Colors.pink[400], Colors.orange],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(itemCard.name,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                itemCard.capital,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          Text(
                            itemCard.population,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Country>> _getData() async {
    var url = "https://restcountries-v1.p.rapidapi.com/"+region;
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
      if (country.population == 140) continue;
      if (_countryList.length < 249) {
        _countryList.add(country);
      }
    }

    _countryList.sort((a, b) => a.name.compareTo(b.name));
    return _countryList;
  }

  Widget build(BuildContext context) {

    Widget _drawerItem(String text){
      return Container(
        child: Material(
          child: InkWell(
            onTap: () {
                Navigator.of(context).pop();
//              if (text == "all") region = "all";
//              else region = "region/"+text.toLowerCase();
//              setState((){
//                    //Navigator.of(context).pop();
//                  }
//              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 55,
              width: 500,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          color: Colors.transparent,
        ),
        color: Colors.white,
      );
    }

    return Scaffold(
        drawer: Container(
          width: MediaQuery.of(context).size.width * 75 / 100,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 175,
                color: Colors.pink[400],
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  _drawerItem("Asia"),
                  _drawerItem("Europe"),
                  _drawerItem("Africa"),
                  _drawerItem("Oceania"),
                  _drawerItem("Americas"),
                  _drawerItem("Polar"),
                  _drawerItem("All"),
                ],
              )),
            ],
          ),
        ),
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
                    return Scrollbar(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          ItemCard card = ItemCard(
                            (snapshot.data[index].name != null)
                                ? snapshot.data[index].name
                                : "",
                            (snapshot.data[index].capital != null)
                                ? snapshot.data[index].capital
                                : "",
                            (snapshot.data[index].alpha2Code != null)
                                ? snapshot.data[index].alpha2Code
                                : "",
                            (snapshot.data[index].alpha3Code != null)
                                ? snapshot.data[index].alpha3Code
                                : "",
                            (snapshot.data[index].region != null)
                                ? snapshot.data[index].region
                                : "",
                            (snapshot.data[index].subregion != null)
                                ? snapshot.data[index].subregion
                                : "",
                            (snapshot.data[index].demonym != null)
                                ? snapshot.data[index].demonym
                                : "",
                            (snapshot.data[index].nativeName != null)
                                ? snapshot.data[index].nativeName
                                : "",
                            (snapshot.data[index].numericCode != null)
                                ? snapshot.data[index].numericCode
                                : "",
                            (snapshot.data[index].relevance != null)
                                ? snapshot.data[index].relevance
                                : "",
                            (snapshot.data[index].area != null)
                                ? formatter.format(snapshot.data[index].area)
                                : "",
                            (snapshot.data[index].gini != null)
                                ? snapshot.data[index].gini.toString()
                                : "",
                            (snapshot.data[index].population != null)
                                ? formatter
                                    .format(snapshot.data[index].population)
                                : "",
                          );
                          return _getItemCard(card, context);
                        },
                      ),
                    );
                  }
                })));
  }
}

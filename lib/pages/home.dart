import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forum/model/country.dart';
import 'package:forum/model/ItemCard.dart';
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

  Widget _getItemCard(ItemCard itemCard, BuildContext context) {
    return GestureDetector(
      onTap: () => _createSingleViewDialog(context, itemCard),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Column(
            children: <Widget>[
              Container(
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
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _createSingleViewDialog(
      BuildContext context, ItemCard itemCard) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (context,animation1,animation2){},
        barrierLabel: '',
        transitionBuilder:(context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Material(
                child: Stack(
                  children: <Widget>[
                    SimpleDialog(
                      backgroundColor: Colors.transparent,
                      children: <Widget>[
                        _singleView(itemCard),
                      ],
                    ),
                    Positioned(
                      height: 70,
                      width: 200,
                      top: 30,
                      left: 81,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              color: Colors.black45,
                            ),
                          ],
                          gradient: LinearGradient(
                              colors: [Colors.pink[400], Colors.orange],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //color: Colors.pink,
                        child: Center(
                            child: Text(
                          itemCard.name,
                          style: TextStyle(color: Colors.white,fontWeight:
                          FontWeight.bold,fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _singleView(ItemCard itemCard) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue[300], Colors.blue],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.only(top: 50),
        child: Column(
            children: <Widget>[
          Text(
            itemCard.alpha2Code,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Alpha 2 Code",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.alpha3Code,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Alpha 3 Code",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.region,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Region",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.subregion,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Subregion",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.demonym,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Demonym",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.nativeName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Native Name",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.numericCode,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Numeric Code",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.relevance,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Relevance",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.area,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Area",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.gini,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Gini",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(color: Colors.black.withAlpha(10),),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCard.population,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Population",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
        ]));
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

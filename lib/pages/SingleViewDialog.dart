import 'package:flutter/material.dart';
import 'package:forum/model/ItemCard.dart';

class SingleViewDialog extends StatelessWidget {
  final ItemCard itemCard;

  SingleViewDialog({Key key, @required this.itemCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createSingleViewDialog(context, itemCard),
    );
  }
}

Widget _singleView(BuildContext context, ItemCard itemCard) {
  return Container(
      width: MediaQuery.of(context).size.width * 80 / 100,
      height: 550,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 3,
              color: Colors.black26,
            ),
          ],
          gradient: LinearGradient(
              colors: [Colors.blue[400], Colors.blue],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.only(top: 70),
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
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
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withAlpha(0),
                  Colors.black.withAlpha(20),
                  Colors.black.withAlpha(0),
                ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 1,
            width: 500,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(20),
                    Colors.black.withAlpha(0),
                  ],begin: Alignment.centerLeft,end: Alignment.centerRight)
              ),
            ),
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
        ]),
      ));
}

Widget _createSingleViewDialog(BuildContext context, ItemCard itemCard) {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Positioned(
          left: 35,
          top: 80,
          child: _singleView(context ,itemCard)),
      Positioned(
        height: 70,
        width: 200,
        top: 30,
        left: 81,
        child: Hero(
          tag: 'hero'+itemCard.alpha3Code,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: Colors.black26,
                ),
              ],
              gradient: LinearGradient(
                  colors: [Colors.pink[400], Colors.orange],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(15),
            ),
            //color: Colors.pink,
            child: Text(
              itemCard.name,
              style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize:16),
              textAlign: TextAlign.center,overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    ],
  );
}

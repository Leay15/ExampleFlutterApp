import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    final star = Container(
      margin: EdgeInsets.only(top: 323.0, right: 3.0),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2c611),
      ),
    );

    final starHalf = Container(
      margin: EdgeInsets.only(top: 323.0, right: 3.0),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2c611),
      ),
    );

    final starBorder = Container(
      margin: EdgeInsets.only(top: 323.0, right: 3.0),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2c611),
      ),
    );

    final descriptionText = Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
      child: Text(
        descriptionPlace,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.justify,
        style:
            TextStyle(fontSize: 15.0, color: Colors.black, letterSpacing: 0.75),
      ),
    );

    List<Widget> getStars(double stars){
      List<Widget> starList = new List();
      for(int i = 0;i<5;i++){
        if(stars == 0){
          starList.add(starBorder);
          continue;
        }
        if((stars-1)>=0){
          starList.add(star);
          stars-=1;
          continue;
        }
        if((stars-1)<0){
          starList.add(starHalf);
          stars = 0;
        }
      }
      return starList;
    }

    final titleStars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
          child: Text(
            namePlace,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: getStars(stars.toDouble()),
        )
      ],
    );

    return new Column(
      children: <Widget>[titleStars, descriptionText],
    );
  }
}

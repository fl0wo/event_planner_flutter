import 'package:EventIt/widgets/profile/utils/screen_size.dart';
import 'package:EventIt/widgets/profile/widgets/donut_charts.dart';
import 'package:EventIt/widgets/profile/widgets/percent_indicator.dart';
import 'package:EventIt/widgets/profile/widgets/wave_progress.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

var data = [
  new DataPerItem('Lunedi', 5, Colors.greenAccent),
  new DataPerItem('Marted', 5, Colors.yellow),
  new DataPerItem('Mercoledi', 3, Colors.indigo),
  new DataPerItem('Giovedi', 2, Colors.pinkAccent),
  new DataPerItem('Venerdi', 10, Colors.brown),
  new DataPerItem('Sabato', 60, Colors.blue),
  new DataPerItem('Domenica', 15, Colors.lightBlueAccent),
];

var series = [
  new charts.Series(
    domainFn: (DataPerItem clickData, _) => clickData.name,
    measureFn: (DataPerItem clickData, _) => clickData.percent,
    colorFn: (DataPerItem clickData, _) => clickData.color,
    id: 'Item',
    data: data,
  ),
];

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 20,
          top: 70,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Details",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Go Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Events quantity",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              inherit: true,
              letterSpacing: 0.4,
            ),
          ),
          Row(
            children: <Widget>[
              colorCard("Events Done", 35, 1, context, Colors.deepPurpleAccent),
              colorCard("Events Partecipated", 101, 1, context, Colors.orange),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Day events flow",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),
                TextSpan(
                  text: "    events/day",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Varela",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            height:
                screenAwareSize(_media.longestSide <= 775 ? 180 : 130, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 180,
                  width: 160,
                  child: DonutPieChart(
                    series,
                    animate: true,
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      donutCard(Colors.indigo, "Lunedi"),
                      donutCard(Colors.yellow, "Martedi"),
                      donutCard(Colors.greenAccent, "Mercoledi"),
                      donutCard(Colors.pinkAccent, "Giovedi"),
                      donutCard(Colors.redAccent, "Venerdi"),
                      donutCard(Colors.brown, "Sabato"),
                      donutCard(Colors.lightBlueAccent, "Domenica"),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Events Accepted",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),
                TextSpan(
                  text: "    % of invites accepted",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Varela",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: 0.68,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFF1b52ff),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "68.0%",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Participants flow",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              inherit: true,
              letterSpacing: 0.4,
            ),
          ),
          vaweCard(
            context,
            "People who accept your events",
            172,
            1,
            Colors.grey.shade100,
            Colors.greenAccent,
          ),
          vaweCard(
            context,
            "People who dont't accept your events",
            3210,
            -1,
            Colors.grey.shade100,
            Color(0xFFff596b),
          ),
        ],
      ),
    );
  }

  Widget vaweCard(BuildContext context, String name, double amount, int type,
      Color fillColor, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      padding: EdgeInsets.only(left: 15),
      height: screenAwareSize(80, context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6,
            spreadRadius: 10,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              WaveProgress(
                screenAwareSize(45, context),
                fillColor,
                bgColor,
                67,
              ),
              Text(
                "80%",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${amount.toString()}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget donutCard(Color color, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 0,
            top: 10,
            right: 10,
          ),
          height: 10,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            inherit: true,
          ),
          overflow: TextOverflow.fade,
          softWrap: true,
        )
      ],
    );
  }

  Widget colorCard(
      String text, double amount, int type, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      padding: EdgeInsets.all(15),
      height: screenAwareSize(90, context),
      width: _media.width / 2 - 25,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${amount.toString()}",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

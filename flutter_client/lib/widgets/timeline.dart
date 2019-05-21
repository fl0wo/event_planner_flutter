import 'package:flutter/material.dart';
import 'dart:math';

Random random = new Random();

// ░▐██▒██▄░▒█▌░▐█▀▀▒▐█▀▀█▌▒▄█▀▀█
// ─░█▌▒▐█▒█▒█░░▐█▀▀▒▐█▄▒█▌▒▀▀█▄▄
// ░▐██▒██░▒██▌░▐█──▒▐██▄█▌▒█▄▄█▀

const distanza_top = 250.0;
const distanza_top_orario = 150.0;
const border_radius = 6.0;
const margine_verticale = 2.0;
const margine_orrizontale = 0.0;
const width_block = 100.0;
const height_block = 50.0;
var zoom = 100;
var old_zoom = 0;
const n_days = 50;

const List colors = [
  Colors.redAccent,
  Colors.purpleAccent,
  Colors.yellowAccent,
  Colors.orangeAccent,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.cyanAccent
];

// ▒█░░░▄░░▒█░▐██░▐█▀█▄░▐█▀▀▀─░▐█▀▀▒█▀█▀█▒▄█▀▀█
// ▒█░░▒█░░▒█─░█▌░▐█▌▐█░▐█░▀█▌░▐█▀▀░░▒█░░▒▀▀█▄▄
// ░▒▀▄▀▒▀▄▀░░▐██░▐█▄█▀░▐██▄█▌░▐█▄▄░▒▄█▄░▒█▄▄█▀

class WeekView extends StatelessWidget {
  BuildContext _c;
  @override
  Widget build(BuildContext context) {
    this._c = context;
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: WeekViewHeaderDelegate(),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: _buildGrid(),
        )
      ],
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _buildGrid() {
    return SizedBox(
      width: width_block * zoom,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(n_days, (d) => _buildColumn(d)),
      ),
    );
  }

  int l_appoggio;
  int n_overflows = 0, old_overflow = 0;

  Widget _buildColumn(int d) {
    return Expanded(
        child: OverflowBox(
      child: Stack(
        overflow: Overflow.visible,
        fit: StackFit.expand,
        children: List.generate(l_appoggio = (1 + random.nextInt(4)),
            (i) => _buildRect(i, l_appoggio, d)),
      ),
    ));
  }

  Widget _buildRect(int i, int l, int d) {
    return i != 0
        ? Positioned(
            left: random.nextDouble() + random.nextInt(100),
            right: random.nextDouble() + -150 + random.nextInt(300),
            //width: width_block + random.nextInt(100),
            //left: 0.0, right: 0.0,
            top: distanza_top +
                (height_block * (i)) -
                (height_block * l / 2.0) -
                (margine_verticale / 2.0 * l) / 2.0,
            height: height_block,
            child: GestureDetector(
              // BISOGNA DEFINIRE BENE LO STILE
              onTap: () {
                Scaffold.of(this._c).showSnackBar(SnackBar(
                  content: Text('Tap'),
                ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: margine_verticale),
                decoration: new BoxDecoration(
                    color: Colors
                        .deepPurpleAccent, //colors[random.nextInt(colors.length)],,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(border_radius),
                        topRight: const Radius.circular(border_radius),
                        bottomRight: const Radius.circular(border_radius),
                        bottomLeft: const Radius.circular(border_radius))),
              ),
            ),
          )
        : _buildTimeAndHour(d);
  }

  Widget _buildTimeAndHour(int d) {
    return Positioned(
      top: distanza_top_orario,
      left: zoom - 5.0,
      child: Text(
        (d % 24) < 10
            ? "0" + (d % 24).toString() + ":00"
            : (d % 24).toString() + ":00",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 10.0, color: Colors.deepPurpleAccent, letterSpacing: 1),
      ),
    );
  }
}

class WeekViewHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Center(
        child: Text(''),
      ),
    );
  }

  @override
  double get maxExtent => distanza_top;

  @override
  double get minExtent => distanza_top;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

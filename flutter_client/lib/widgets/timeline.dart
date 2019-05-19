import 'package:flutter/material.dart';
import 'dart:math';

Random random = new Random();

const distanza_top = 250.0;
const margine_verticale = 2.0;
const margine_orrizontale = 0.0;

const width_block = 100.0;
const height_block = 50.0;

class WeekView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      width: width_block * 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(50, (d) => _buildColumn(d)),
      ),
    );
  }

  int l_appoggio;

  Widget _buildColumn(int d) {
    return Expanded(
      child: Stack(
        children: List.generate(l_appoggio = (1 + random.nextInt(4)),
            (d) => _buildRect(d, l_appoggio)),
      ),
    );
  }

  Widget _buildRect(int i, int l) {
    return Positioned(
      left: 0,
      right: 0,
      // width: width_block + random.nextInt(50),
      top: distanza_top +
          (height_block * i) -
          (height_block * l / 2.0) -
          (margine_verticale / 2.0 * l) / 2.0,
      height: height_block,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: margine_verticale),
        color: Colors.deepPurpleAccent,
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

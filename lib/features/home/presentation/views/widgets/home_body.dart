import 'package:flutter/material.dart';

import 'home_sections/historical_character_section.dart';
import 'home_sections/historical_period_section.dart';

import 'home_sections/historical_sovenirs_section.dart';
import 'home_sections/home_app_bar_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: HomeAppBarSection()),
          SliverToBoxAdapter(child: HistoricalPeriodSection()),
          SliverToBoxAdapter(child: HistoricalCharacterSection()),
          SliverToBoxAdapter(child: HistoricalSovenirsSection()),
        ],
      ),
    );
  }
}

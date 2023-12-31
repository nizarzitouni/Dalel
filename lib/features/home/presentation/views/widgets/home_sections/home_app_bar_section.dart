import 'package:flutter/material.dart';

import '../custom_home_view_app_bar.dart';

class HomeAppBarSection extends StatelessWidget {
  const HomeAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 28.0),
        CustomHomeViewAppBAr(),
        SizedBox(height: 32.0),
      ],
    );
  }
}

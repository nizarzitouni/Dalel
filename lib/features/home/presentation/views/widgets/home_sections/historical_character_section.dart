import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/custom_header_text.dart';
import '../custom_category_list_view.dart';

class HistoricalCharacterSection extends StatelessWidget {
  const HistoricalCharacterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalCharacters),
        SizedBox(height: 16.0),
        CustomCategoryListView(),
        SizedBox(height: 32.0),
      ],
    );
  }
}

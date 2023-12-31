import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 10,
            color: AppColors.grey,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.amber,
              image: const DecorationImage(
                image: AssetImage(AppAssets.imagesFrame3),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Text(
            'Lionhear',
            style: AppTextStyles.poppins500style14,
            // textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

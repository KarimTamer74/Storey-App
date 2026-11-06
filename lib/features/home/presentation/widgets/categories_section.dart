// features/home/presentation/widgets/categories_section.dart
import 'package:flutter/material.dart';
import 'package:storey_app/core/common_widgets/app_text_button.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories', style: AppStyles.style20SemiBold),
            CustomTextButton(text: 'See All', onPressed: () {}),
          ],
        ),
        SizedBox(height: 16),

        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 80,
                child: Column(
                  spacing: 10,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.containerBackgroundClr,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.phone,
                        size: 40,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      'SmartphonesSmartphonesSmartphonesSmartphones',
                      style: AppStyles.style12Regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

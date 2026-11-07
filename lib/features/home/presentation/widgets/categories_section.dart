// features/home/presentation/widgets/categories_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/core/common_widgets/app_text_button.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:storey_app/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:storey_app/features/home/presentation/cubits/categories_cubit/categories_states.dart';

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

        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoriesError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is CategoriesLoaded) {
              final categories = state.categories;
              return SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 80,
                      child: Column(
                        spacing: 10,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  alignment: Alignment.center,

                                  image: NetworkImage(
                                    categories[index].imageUrl,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                color: AppColors.containerBackgroundClr,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          Text(
                            categories[index].name,
                            style: AppStyles.style12Regular,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ],
    );
  }
}

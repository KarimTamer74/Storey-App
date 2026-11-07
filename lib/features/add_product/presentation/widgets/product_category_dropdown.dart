// features/add_product/presentation/widgets/product_category_dropdown.dart
import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:storey_app/features/home/data/models/category_model.dart';
import 'package:storey_app/features/home/presentation/cubits/categories_cubit/categories_states.dart';

class ProductCategoryDropdown extends StatelessWidget {
  const ProductCategoryDropdown({
    required this.state,
    required this.selectedCategory,
    required this.hasError,
    required this.onChanged,
    required this.onRetry,
    super.key,
  });

  final CategoriesState state;
  final CategoryModel? selectedCategory;
  final bool hasError;
  final ValueChanged<CategoryModel?> onChanged;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Category',
          style: AppStyles.style16SemiBold.copyWith(
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 6),
        if (state is CategoriesLoading || state is CategoriesInitial)
          _decoratedContent(
            child: Row(
              children: [
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: AppStyles.space12),
                Text(
                  'Loading categories...',
                  style: AppStyles.style16Regular.copyWith(
                    color: AppColors.textHint,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        else if (state is CategoriesError)
          _decoratedContent(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Could not load categories',
                    style: AppStyles.style14Regular.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Retry loading categories',
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh, color: AppColors.primary),
                ),
              ],
            ),
          )
        else if (state is CategoriesLoaded)
          _buildDropdown(context, [ ])
        else
          _decoratedContent(
            child: Text(
              'Categories are unavailable',
              style: AppStyles.style16Regular.copyWith(
                color: AppColors.textHint,
                fontSize: 14,
              ),
            ),
          ),
        if (hasError) ...[
          const SizedBox(height: AppStyles.space4),
          Text(
            'Please select a category',
            style: AppStyles.style12Regular.copyWith(color: AppColors.error),
          ),
        ],
      ],
    );
  }

  Widget _buildDropdown(BuildContext context, List<CategoryModel> categories) {
    return SizedBox(
      height: 48,
      child: DropdownButtonFormField<CategoryModel>(
        initialValue: selectedCategory,
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.textHint,
          size: 24,
        ),
        style: AppStyles.style16Regular.copyWith(
          color: AppColors.textPrimary,
          fontSize: 14,
        ),
        hint: Text(
          'Select category',
          style: AppStyles.style16Regular.copyWith(
            color: AppColors.textHint,
            fontSize: 14,
          ),
        ),
        decoration: _decoration(),
        items: categories
            .map(
              (category) => DropdownMenuItem<CategoryModel>(
                value: category,
                child: Text(
                  category.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _decoratedContent({required Widget child}) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppStyles.radiusInput),
      ),
      child: child,
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppStyles.radiusInput),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppStyles.radiusInput),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppStyles.radiusInput),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }
}

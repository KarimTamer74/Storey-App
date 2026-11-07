import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';

class ProductTextField extends StatelessWidget {
  const ProductTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.isRequired = false,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isRequired;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;

  bool get _isMultiline => maxLines != 1 || minLines != null;

  @override
  Widget build(BuildContext context) {
    final field = TextFormField(
      controller: controller,
      validator: validator,
      minLines: minLines,
      maxLines: maxLines,
      expands: _isMultiline && maxLines == null,
      textAlignVertical: _isMultiline
          ? TextAlignVertical.top
          : TextAlignVertical.center,
      style: AppStyles.style16Regular.copyWith(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyles.style16Regular.copyWith(
          color: AppColors.textHint,
          fontSize: 14,
        ),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radiusInput),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radiusInput),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _FieldLabel(label: label, isRequired: isRequired),
        const SizedBox(height: 6),
        if (_isMultiline)
          SizedBox(height: 114, child: field)
        else
          SizedBox(height: 48, child: field),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.label, required this.isRequired});

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppStyles.style16SemiBold.copyWith(
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0,
        ),
        children: [
          TextSpan(text: label),
          if (isRequired)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: AppColors.error),
            ),
        ],
      ),
    );
  }
}

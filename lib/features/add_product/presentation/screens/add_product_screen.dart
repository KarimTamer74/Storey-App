import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storey_app/core/common_widgets/app_elevated_button.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:storey_app/features/add_product/presentation/widgets/product_category_dropdown.dart';
import 'package:storey_app/features/add_product/presentation/widgets/product_images_picker.dart';
import 'package:storey_app/features/add_product/presentation/widgets/product_text_field.dart';
import 'package:storey_app/features/home/data/models/category_model.dart';
import 'package:storey_app/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:storey_app/features/home/presentation/cubits/categories_cubit/categories_states.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..fetchCategories(),
      child: const _AddProductForm(),
    );
  }
}

class _AddProductForm extends StatefulWidget {
  const _AddProductForm();

  @override
  State<_AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<_AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _brandController = TextEditingController();
  final _imagePicker = ImagePicker();
  final List<XFile> _selectedImages = [];

  int? _selectedCategoryId;
  String? _selectedCategoryName;
  bool _categoryHasError = false;

  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionController.dispose();
    _brandController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    try {
      final images = await _imagePicker.pickMultiImage();
      if (!mounted || images.isEmpty) return;

      setState(() {
        final existingPaths = _selectedImages
            .map((image) => image.path)
            .toSet();
        _selectedImages.addAll(
          images.where((image) => existingPaths.add(image.path)),
        );
      });
    } on PlatformException catch (error) {
      debugPrint('Image selection failed: ${error.message}');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to select images. Please try again.'),
        ),
      );
    }
  }

  void _removeImage(XFile image) {
    setState(() => _selectedImages.remove(image));
  }

  void _submitProduct() {
    final isFormValid = _formKey.currentState?.validate() ?? false;
    setState(() => _categoryHasError = _selectedCategoryId == null);
    if (!isFormValid || _selectedCategoryId == null) return;

    debugPrint('Product Name: ${_productNameController.text.trim()}');
    debugPrint('Description: ${_descriptionController.text.trim()}');
    debugPrint('Brand: ${_brandController.text.trim()}');
    debugPrint('Category Name: $_selectedCategoryName');
    debugPrint('Category ID: $_selectedCategoryId');
    debugPrint('Selected Images Count: ${_selectedImages.length}');
    for (var index = 0; index < _selectedImages.length; index++) {
      debugPrint('Image ${index + 1}: ${_selectedImages[index].path}');
    }
  }

  void _handleCategoryChanged(CategoryModel? category) {
    setState(() {
      _selectedCategoryId = category?.id;
      _selectedCategoryName = category?.name;
      _categoryHasError = false;
    });
  }

  void _goBack() {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) navigator.pop();
  }

  CategoryModel? _selectedCategoryFor(CategoriesState state) {
    if (state is! CategoriesLoaded || _selectedCategoryId == null) {
      return null;
    }
    for (final category in state.categories) {
      if (category.id == _selectedCategoryId) return category;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 68,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Material(
                      color: AppColors.surfaceSecondary,
                      borderRadius: BorderRadius.circular(
                        AppStyles.radiusInput,
                      ),
                      child: InkWell(
                        onTap: _goBack,
                        borderRadius: BorderRadius.circular(
                          AppStyles.radiusInput,
                        ),
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xFF1E293B),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppStyles.space16),
                    Text(
                      'Add Product',
                      style: AppStyles.style20SemiBold.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, categoryState) {
                  return SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ProductImagesPicker(
                            images: _selectedImages,
                            onTap: _pickImages,
                            onRemove: _removeImage,
                          ),
                          const SizedBox(height: AppStyles.space20),
                          ProductTextField(
                            controller: _productNameController,
                            label: 'Product Title',
                            hint: 'e.g. iPhone 15 Pro',
                            isRequired: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Product title is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppStyles.space16),
                          ProductTextField(
                            controller: _descriptionController,
                            label: 'Description',
                            hint: 'Product description...',
                            maxLines: 5,
                            minLines: 4,
                          ),
                          const SizedBox(height: AppStyles.space16),
                          ProductTextField(
                            controller: _brandController,
                            label: 'Brand',
                            hint: 'e.g. Apple',
                          ),
                          const SizedBox(height: AppStyles.space16),
                          ProductCategoryDropdown(
                            state: categoryState,
                            selectedCategory: _selectedCategoryFor(
                              categoryState,
                            ),
                            hasError: _categoryHasError,
                            onChanged: _handleCategoryChanged,
                            onRetry: () {
                              context.read<CategoriesCubit>().fetchCategories();
                            },
                          ),
                          const SizedBox(height: AppStyles.space24),
                          AppElevatedButton(
                            label: 'Add Product',
                            onPressed: _submitProduct,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

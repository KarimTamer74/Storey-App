import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';

class ProductImagesPicker extends StatelessWidget {
  const ProductImagesPicker({
    required this.images,
    required this.onTap,
    required this.onRemove,
    super.key,
  });

  final List<XFile> images;
  final VoidCallback onTap;
  final ValueChanged<XFile> onRemove;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppStyles.radiusCard),
      child: CustomPaint(
        foregroundPainter: _DashedBorderPainter(),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 142),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppStyles.radiusCard),
          ),
          child: images.isEmpty
              ? const _EmptyImagePicker()
              : Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.2,
                          ),
                      itemBuilder: (context, index) {
                        final image = images[index];
                        return _ImagePreview(
                          image: image,
                          onRemove: () => onRemove(image),
                        );
                      },
                    ),
                    const SizedBox(height: AppStyles.space8),
                    Text(
                      'Tap to add more photos',
                      style: AppStyles.style14Hint,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _EmptyImagePicker extends StatelessWidget {
  const _EmptyImagePicker();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 118,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_a_photo_outlined,
            color: AppColors.textPlaceholder,
            size: 40,
          ),
          SizedBox(height: AppStyles.space12),
          Text('Tap to select product images', style: AppStyles.style14Hint),
        ],
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({required this.image, required this.onRemove});

  final XFile image;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppStyles.radiusDefault),
      child: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder<Uint8List>(
            future: image.readAsBytes(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const ColoredBox(
                  color: AppColors.surfaceSecondary,
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              }
              return Image.memory(
                snapshot.data!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const ColoredBox(
                  color: AppColors.surfaceSecondary,
                  child: Icon(Icons.broken_image_outlined),
                ),
              );
            },
          ),
          Positioned(
            top: 2,
            right: 2,
            child: Material(
              color: AppColors.textPrimary.withValues(alpha: 0.72),
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onRemove,
                customBorder: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.close,
                    color: AppColors.textOnPrimary,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final borderPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          const Radius.circular(AppStyles.radiusCard),
        ),
      );
    final paint = Paint()
      ..color = const Color(0xFFBFDBFE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (final metric in borderPath.computeMetrics()) {
      for (double distance = 0; distance < metric.length; distance += 12) {
        canvas.drawPath(
          metric.extractPath(distance, math.min(distance + 6, metric.length)),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

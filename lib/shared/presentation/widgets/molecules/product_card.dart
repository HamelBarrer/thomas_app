import 'package:flutter/material.dart';
import 'package:thomas_app/core/theme/app_colors.dart';
import 'package:thomas_app/core/theme/app_shadows.dart';
import 'package:thomas_app/features/products/domain/entities/product.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/app_badge.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/decorative_atoms.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/price_text.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/product_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: AppColors.subtleBackgroundGradient,
          boxShadow: AppShadows.primaryMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Hero(
                    tag: 'product-${product.id}',
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.background,
                            AppColors.backgroundLight,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Stack(
                        children: [
                          DecorativeCircle(
                            size: 100,
                            color: AppColors.primary,
                            opacity: 0.05,
                            alignment: Alignment.topRight,
                          ),
                          DecorativeCircle(
                            size: 120,
                            color: AppColors.secondary,
                            opacity: 0.08,
                            alignment: Alignment.bottomLeft,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: ProductImage(
                                imageUrl: product.image,
                                width: double.infinity,
                                height: double.infinity,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(top: 16, left: 16, child: AppBadge.featured()),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          height: 1.3,
                          letterSpacing: -0.2,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: PriceText(
                            price: product.price,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                        GradientContainer(
                          padding: const EdgeInsets.all(8),
                          borderRadius: 12,
                          boxShadow: AppShadows.primaryButton,
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

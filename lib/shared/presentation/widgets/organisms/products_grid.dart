import 'package:flutter/material.dart';
import 'package:thomas_app/features/products/domain/entities/product.dart';
import 'package:thomas_app/shared/presentation/widgets/molecules/product_card.dart';

class ProductsGrid extends StatefulWidget {
  final List<Product> products;
  final Function(Product) onProductTap;
  final Future<void> Function() onRefresh;

  const ProductsGrid({
    super.key,
    required this.products,
    required this.onProductTap,
    required this.onRefresh,
  });

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;
  late AnimationController _fabAnimationController;
  late Animation<double> _fabAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fabAnimation = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 400 && !_showScrollToTop) {
      setState(() {
        _showScrollToTop = true;
      });
      _fabAnimationController.forward();
    } else if (_scrollController.offset <= 400 && _showScrollToTop) {
      _fabAnimationController.reverse().then((_) {
        if (mounted) {
          setState(() {
            _showScrollToTop = false;
          });
        }
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: widget.onRefresh,
          child: GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.45,
            ),
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              final product = widget.products[index];
              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 300 + (index * 50)),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: ProductCard(
                  product: product,
                  onTap: () => widget.onProductTap(product),
                ),
              );
            },
          ),
        ),
        if (_showScrollToTop)
          Positioned(
            right: 16,
            bottom: 16,
            child: ScaleTransition(
              scale: _fabAnimation,
              child: FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.arrow_upward,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

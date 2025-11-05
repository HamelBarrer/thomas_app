import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thomas_app/core/utils/formatters.dart';
import 'package:thomas_app/features/products/domain/entities/product.dart';
import 'package:thomas_app/features/sales/domain/entities/sale.dart';
import 'package:thomas_app/features/sales/presentation/providers/sales_provider.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/price_text.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/product_image.dart';
import 'package:thomas_app/shared/presentation/widgets/molecules/custom_text_field.dart';

class SaleBottomSheet extends ConsumerStatefulWidget {
  final Product? product;
  final Sale? sale;

  const SaleBottomSheet({super.key, this.product, this.sale})
    : assert(
        product != null || sale != null,
        'Either product or sale must be provided',
      );

  @override
  ConsumerState<SaleBottomSheet> createState() => _SaleBottomSheetState();
}

class _SaleBottomSheetState extends ConsumerState<SaleBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _clientController;
  late TextEditingController _quantityController;
  late DateTime _selectedDate;
  bool _isLoading = false;

  bool get isEditing => widget.sale != null;

  String get productTitle => widget.sale?.productTitle ?? widget.product!.title;
  String get productImage => widget.sale?.productImage ?? widget.product!.image;
  double get unitPrice => widget.sale?.unitPrice ?? widget.product!.price;

  @override
  void initState() {
    super.initState();
    _clientController = TextEditingController(
      text: widget.sale?.clientName ?? '',
    );
    _quantityController = TextEditingController(
      text: widget.sale?.quantity.toString() ?? '1',
    );
    _selectedDate = widget.sale?.saleDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _clientController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  int get _quantity {
    final value = int.tryParse(_quantityController.text);
    return value ?? (widget.sale?.quantity ?? 1);
  }

  double get _totalPrice => unitPrice * _quantity;

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    bool success;

    if (isEditing) {
      final updatedSale = Sale(
        id: widget.sale!.id,
        clientName: _clientController.text.trim(),
        productId: widget.sale!.productId,
        productTitle: widget.sale!.productTitle,
        productImage: widget.sale!.productImage,
        quantity: _quantity,
        unitPrice: widget.sale!.unitPrice,
        totalPrice: _totalPrice,
        saleDate: _selectedDate,
      );
      success = await ref.read(salesProvider.notifier).updateSale(updatedSale);
    } else {
      final newSale = Sale(
        clientName: _clientController.text.trim(),
        productId: widget.product!.id,
        productTitle: widget.product!.title,
        productImage: widget.product!.image,
        quantity: _quantity,
        unitPrice: widget.product!.price,
        totalPrice: _totalPrice,
        saleDate: _selectedDate,
      );
      success = await ref.read(salesProvider.notifier).createSale(newSale);
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      if (success) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isEditing
                  ? 'Venta actualizada correctamente'
                  : 'Venta registrada correctamente',
            ),
            backgroundColor: const Color(0xFF7C4DFF),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isEditing
                  ? 'Error al actualizar la venta'
                  : 'Error al registrar la venta',
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding =
        MediaQuery.of(context).viewInsets.bottom +
        MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF8F7FC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isEditing ? 'Editar Venta' : 'Nueva Venta',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Flexible(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  20 + (bottomPadding > 0 ? bottomPadding : 16),
                ),
                shrinkWrap: true,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF7C4DFF,
                          ).withValues(alpha: 0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F7FC),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: ProductImage(
                              imageUrl: productImage,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productTitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A1A1A),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Text(
                                    'Precio: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  PriceText(
                                    price: unitPrice,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF7C4DFF),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  CustomTextField(
                    label: 'Nombre del Cliente *',
                    hintText: 'Ingrese el nombre del cliente',
                    controller: _clientController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'El nombre del cliente es requerido';
                      }
                      if (value.trim().length < 3) {
                        return 'El nombre debe tener al menos 3 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    label: 'Cantidad *',
                    hintText: 'Ingrese la cantidad',
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'La cantidad es requerida';
                      }
                      final quantity = int.tryParse(value);
                      if (quantity == null) {
                        return 'Ingrese un número válido';
                      }
                      if (quantity < 1) {
                        return 'La cantidad mínima es 1';
                      }
                      if (quantity > 99) {
                        return 'La cantidad máxima es 99';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    label: 'Fecha de Venta *',
                    hintText: 'Seleccione la fecha',
                    readOnly: true,
                    controller: TextEditingController(
                      text: Formatters.formatDate(_selectedDate),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context),
                  ),
                  const SizedBox(height: 24),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7C4DFF), Color(0xFF9575CD)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF7C4DFF).withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'a pagar',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        PriceText(
                          price: _totalPrice,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C4DFF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              isEditing ? 'Guardar Cambios' : 'Registrar Venta',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool?> showSaleBottomSheet(
  BuildContext context, {
  Product? product,
  Sale? sale,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SaleBottomSheet(product: product, sale: sale),
    ),
  );
}

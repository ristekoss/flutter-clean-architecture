import 'package:flutter/material.dart';

import '../../../../../design/constants/colors.dart';
import '../../../../../design/widgets/atom/app_text_field.dart';

class ProductHomeAppBarWidget extends StatelessWidget {
  final TextEditingController controller;

  const ProductHomeAppBarWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 256,
      floating: true,
      pinned: true,
      snap: false,
      backgroundColor: AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24.0),
          ),
          child: Image.network(
            'https://cdn.dummyjson.com/product-images/4/thumbnail.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24))),
      bottom: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 88,
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              24,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: controller,
                  hint: 'Masukkan pencarian...',
                ),
              ),
              const Icon(
                Icons.search,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

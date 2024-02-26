import 'package:boilerplate/features/product/presentation/home/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../services/di.dart';
import '../blocs/product_home_bloc.dart';
import '../blocs/product_home_states.dart';
import '../blocs/states/get_home_product_states.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductHomeBloc, ProductHomeStates>(
      bloc: di<ProductHomeBloc>(),
      listenWhen: (p, n) {
        return n is GetHomeProductErrorState;
      },
      listener: (context, state) {
        if (state is GetHomeProductErrorState) {
          final snackBar = SnackBar(content: Text(state.message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (p, n) {
        return n is GetHomeProductSuccessState ||
            n is GetHomeProductLoadingState ||
            n is GetHomeProductErrorState ||
            n is GetHomeProductInitialState;
      },
      builder: (context, state) {
        if (state is GetHomeProductSuccessState) {
          return SliverToBoxAdapter(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                final item = state.products[index];

                return ProductItemWidget(
                  title: item.title,
                  price: item.price.toString(),
                  category: item.category,
                  image: item.thumbnail,
                );
              },
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Skeletonizer(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const ProductItemWidget(
                  title: 'Samsung',
                  price: '599',
                  category: 'bike',
                  image: '',
                );
              },
            ),
          ),
        );
      },
    );
  }
}

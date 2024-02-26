import 'dart:developer';

import 'package:boilerplate/features/product/data/static/product_static_data_sources.dart';
import 'package:boilerplate/features/product/presentation/home/blocs/event/get_home_product_event.dart';
import 'package:boilerplate/features/product/presentation/home/blocs/product_home_bloc.dart';
import 'package:boilerplate/features/product/presentation/home/blocs/product_home_states.dart';
import 'package:boilerplate/features/product/presentation/home/blocs/states/get_home_product_states.dart';
import 'package:boilerplate/features/product/presentation/home/widgets/product_category_item_widget.dart';
import 'package:boilerplate/features/product/presentation/home/widgets/product_home_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/di.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  static const route = '/product_home';

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    di<ProductHomeBloc>().add(GetHomeProductEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        di<ProductHomeBloc>().add(GetHomeProductEvent());
      },
      child: CustomScrollView(
        slivers: <Widget>[
          ProductHomeAppBarWidget(
            controller: _searchController,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                itemCount: ProductStaticDataSources.productCategories.length,
                itemBuilder: (context, index) {
                  final item = ProductStaticDataSources.productCategories[index];
                  return ProductCategoryItemWidget(
                    icon: item.icon,
                    text: item.title,
                  );
                },
              ),
            ),
          ),
          BlocBuilder<ProductHomeBloc, ProductHomeStates>(
            bloc: di<ProductHomeBloc>(),
            buildWhen: (p, n) {
              return n is GetHomeProductSuccessState ||
                  n is GetHomeProductLoadingState ||
                  n is GetHomeProductErrorState ||
                  n is GetHomeProductInitialState;
            },
            builder: (context, state) {
              log('states');
              log(state.toString());
              if (state is GetHomeProductSuccessState) {
                return SliverGrid.builder(
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final item = state.products[index];

                    return Container(
                      alignment: Alignment.center,
                      color: Colors.teal[100 * (index % 9)],
                      child: Text(
                        item.title.toString(),
                      ),
                    );
                  },
                );
              }
              if (state is GetHomeProductLoadingState) {
                return const SliverToBoxAdapter(child: CircularProgressIndicator());
              }
              return const SliverToBoxAdapter(child: SizedBox());
            },
          ),
        ],
      ),
    );
  }
}

import 'package:boilerplate/features/product/presentation/home/blocs/product_home_states.dart';

import '../../../../domain/model/product.dart';

class GetHomeProductInitialState extends ProductHomeStates {
  @override
  List<Object?> get props => [];
}

class GetHomeProductLoadingState extends ProductHomeStates {
  @override
  List<Object?> get props => [];
}

class GetHomeProductSuccessState extends ProductHomeStates {
  final List<Product> products;
  GetHomeProductSuccessState({required this.products});

  @override
  List<Object?> get props => [products];
}

class GetHomeProductErrorState extends ProductHomeStates {
  final String message;

  GetHomeProductErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

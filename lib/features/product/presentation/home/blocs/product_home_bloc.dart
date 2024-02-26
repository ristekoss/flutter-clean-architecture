import 'package:boilerplate/features/product/presentation/home/blocs/event/get_home_product_event.dart';
import 'package:boilerplate/features/product/presentation/home/blocs/product_home_event.dart';
import 'package:boilerplate/features/product/presentation/home/blocs/product_home_states.dart';
import 'package:boilerplate/features/product/presentation/home/blocs/states/get_home_product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/product_use_cases.dart';

class ProductHomeBloc extends Bloc<ProductHomeEvent, ProductHomeStates> {
  final ProductUseCases _useCases;

  ProductHomeBloc(this._useCases) : super(GetHomeProductInitialState()) {
    on<GetHomeProductEvent>(_onGetHomeProductEvent);
  }

  Future _onGetHomeProductEvent(
    GetHomeProductEvent event,
    Emitter<ProductHomeStates> emitter,
  ) async {
    emitter(GetHomeProductLoadingState());
    final response = await _useCases.getProducts(6, 0);
    response.fold(
          (l) {
        emitter(
          GetHomeProductErrorState(message: l.message ?? ''),
        );
      },
          (r) {
        emitter(GetHomeProductSuccessState(products: r));
      },
    );
  }
}

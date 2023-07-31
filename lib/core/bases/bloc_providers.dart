import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boilerplate/features/main/presentation/bloc/main_cubit.dart';

import '../../services/di.dart';

class BlocProviders {
  static blocs(){
    return [
      BlocProvider(create: (context) => di<MainCubit>()),
    ];
  }
}
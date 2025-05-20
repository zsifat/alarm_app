import 'package:alarm_app/features/wellcome/presentation/bloc/loaction_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static get providers => [
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(),
        )
      ];
}

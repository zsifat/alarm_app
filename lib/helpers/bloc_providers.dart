import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home/presentation/cubit/alarm_cubit.dart';
import '../features/wellcome/presentation/cubit/location_cubit.dart';

class BlocProviders {
  static get providers => [
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(),
        ),
        BlocProvider<AlarmCubit>(
          create: (context) => AlarmCubit(),
        )
      ];
}

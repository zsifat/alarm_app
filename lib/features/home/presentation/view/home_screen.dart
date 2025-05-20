import 'package:alarm_app/common_widgets/custom_button.dart';
import 'package:alarm_app/constants/image_constants.dart';
import 'package:alarm_app/features/home/presentation/cubit/alarm_state.dart';
import 'package:alarm_app/helpers/app_theme/app_colors.dart';
import 'package:alarm_app/helpers/app_theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/custom_alarm_item.dart';
import '../../../wellcome/presentation/cubit/location_cubit.dart';
import '../../../wellcome/presentation/cubit/location_state.dart';
import '../cubit/alarm_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<DateTime?> pickDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return null; // User cancelled date picker

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return null; // User cancelled time picker

    return DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Location',
                      style: AppTextStyles.t16b600_FFF,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(ImageConstants.locationV2Icon),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: BlocBuilder<LocationCubit, LocationState>(
                              builder: (context, state) {
                                if (state is LocationLoaded) {
                                  return Text(state.locationName,
                                    style: AppTextStyles.t16b400_FFF,
                                  );
                                } else {
                                  return Text(
                                    "Current Location Not Available",
                                    style: AppTextStyles.t16b400_FFF,
                                  );
                                }
                              },
                            ))
                      ],
                    ),
                    SizedBox(height: 10,),
                    CustomButton(
                      title: 'Add Alarm',
                      backgroundColor: AppColors.greyD4D,
                      titleTextStyle: AppTextStyles.t16b400_FFF,
                      onTap: () async{
                        final selectedDateTime = await pickDateTime(context);
                        if (selectedDateTime == null) return;

                        if (selectedDateTime.isBefore(DateTime.now())) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please select a future date and time."),backgroundColor: Colors.red,),
                          );
                          return;
                        }
                        context.read<AlarmCubit>().addAlarm(selectedDateTime);
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alarms',
                    style: AppTextStyles.t18b500_FFF,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: BlocBuilder<AlarmCubit, AlarmState>(
                      builder: (context, state) {
                        if(state.alarms.isEmpty){
                          return Center(child: Text('No alarms added', style: AppTextStyles.t16b400_FFF));
                        }
                        return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final alarm = state.alarms[index];
                              final timeText = TimeOfDay.fromDateTime(alarm.dateTime).format(context);
                              final dateText = DateFormat('EEE dd MMM yyyy').format(alarm.dateTime);
                              return CustomAlarmItem(
                                time: timeText,
                                date: dateText,
                                isEnabled: alarm.enabled,
                                onChanged: (value) {
                                  context.read<AlarmCubit>().toggleAlarm(index, value);
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10,);
                            },
                            itemCount: state.alarms.length);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

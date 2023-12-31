import 'package:dalel/core/function/custom_toast.dart';
import 'package:dalel/features/home/presentation/view_manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_shimmer_category.dart';
import 'historical_periods_item.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeridosFailureState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        //HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        //HomeCubit homeCubit = context.read<HomeCubit>();
        return state is GetHistoricalPeridosLoadingState
            ? const CustomShimmerCategory()
            : SizedBox(
                height: 96,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  itemCount: context.read<HomeCubit>().historicalPeriods.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HistoricalPeriodItem(
                      historicalPeriodsModel: context.read<HomeCubit>().historicalPeriods[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                ),
              );
      },
    );
  }
}

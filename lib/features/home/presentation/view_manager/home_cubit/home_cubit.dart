// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../data/models/historical_periods_model.dart';
import '../../../data/models/wars_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<WarsModel> warsList = [];

  getHistoricalPeridos() async {
    emit(GetHistoricalPeridosLoadingState());
    try {
      await FirebaseFirestore.instance.collection(FireBaseStrings.historicalPeriods).get().then(
            // ignore: avoid_function_literals_in_foreach_calls
            (value) => value.docs.forEach(
              (element) async {
                await getWarsList(element);
                historicalPeriods.add(
                  HistoricalPeriodsModel.fromJson(
                    element.data(),
                    warsList,
                  ),
                );
              },
            ),
          );
      emit(GetHistoricalPeridosSuccessState());
    } on Exception catch (e) {
      emit(GetHistoricalPeridosFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> getWarsList(QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FireBaseStrings.historicalPeriods)
        .doc(element.id)
        .collection(FireBaseStrings.wars)
        .get()
        .then(
          // ignore: avoid_function_literals_in_foreach_calls
          (value) => value.docs.forEach(
            (element) {
              warsList.add(
                WarsModel.fromjson(
                  element.data(),
                ),
              );
            },
          ),
        );
  }
}

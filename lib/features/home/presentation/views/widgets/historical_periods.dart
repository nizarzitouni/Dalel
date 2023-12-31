import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_shimmer_category.dart';
import '../../../data/models/wars_model.dart';
import 'historical_periods_item.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection(FireBaseStrings.historicalPeriods).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            getHistoricalPeridos();
            //return const CustomShimmerCategory();
            return SizedBox(
              height: 96,
              child: ListView.separated(
                itemCount: historicalPeriods.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HistoricalPeriodItem(
                    historicalPeriodsModel: historicalPeriods[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            );
          }

          return const CustomShimmerCategory();
        });
  }
}

List<HistoricalPeriodsModel> historicalPeriods = [];
List<WarsModel> warsList = [];

getHistoricalPeridos() async {
  try {
    await FirebaseFirestore.instance.collection(FireBaseStrings.historicalPeriods).get().then(
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
  } on Exception catch (e) {
    debugPrint('----------------------${e.toString()} ----------------------');
  }
}

Future<void> getWarsList(QueryDocumentSnapshot<Map<String, dynamic>> element) async {
  await FirebaseFirestore.instance
      .collection(FireBaseStrings.historicalPeriods)
      .doc(element.id)
      .collection(FireBaseStrings.wars)
      .get()
      .then(
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

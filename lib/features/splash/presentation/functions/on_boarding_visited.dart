import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: isOnBoardingVisited, value: true);
}

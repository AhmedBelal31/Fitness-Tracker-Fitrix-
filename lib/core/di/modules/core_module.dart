import '../../helpers/notification_service.dart';
import '../../networking/dio_helper.dart';
import '../get_it.dart';

void setupCoreModule() {
  di.registerLazySingleton<ApiService>(() => ApiService());
  di.registerLazySingleton<NotificationService>(() => NotificationService());
  di.registerLazySingleton<FirebaseTokenService>(() => FirebaseTokenService());
}

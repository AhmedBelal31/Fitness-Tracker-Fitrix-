// import '../../../features/login/domain/repos/auth_repo/auth_repo.dart';
// import '../../../features/login/domain/repos/auth_repo/auth_repo_impl.dart';
// import '../../../features/login/domain/repos/categories_repo/categories_repo.dart';
// import '../../../features/login/domain/repos/questions_repo/questions_repo.dart';
// import '../../../features/login/domain/repos/social_auth_repo/scoial_auth_repo.dart';
// import '../../../features/login/presentation/cubit/auth_cubit.dart';
// import '../get_it.dart';
//
// void setupAuthModule() {
//   di.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(apiService: di()));
//   di.registerFactory<AuthCubit>(
//     () => AuthCubit(
//       authRepo: di<AuthRepo>(),
//       socialAuthRepo: di<SocialAuthRepo>(),
//       categoriesRepo: di<CategoriesRepo>(),
//       questionsRepo: di<QuestionsRepo>(),
//     ),
//   );
// }

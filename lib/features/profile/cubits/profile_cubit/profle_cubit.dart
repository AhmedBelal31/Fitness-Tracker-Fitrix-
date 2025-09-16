import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profle_state.dart';

class ProfleCubit extends Cubit<ProfleState> {
  ProfleCubit() : super(ProfleInitial());
}

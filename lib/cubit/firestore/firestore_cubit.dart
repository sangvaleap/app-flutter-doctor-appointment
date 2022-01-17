import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'firestore_state.dart';

class FirestoreCubit extends Cubit<FirestoreState>{
  FirestoreCubit() : super(FirestoreInitial());

  void refreshData(){
    emit(RefreshSuccess());
  }
}
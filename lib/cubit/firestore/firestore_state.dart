part of 'firestore_cubit.dart';

@immutable
abstract class FirestoreState {}

class FirestoreInitial extends FirestoreState{}

class RefreshSuccess extends FirestoreState{
  RefreshSuccess();
}